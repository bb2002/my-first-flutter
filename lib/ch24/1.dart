import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../firebase_options.dart';

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AuthWidget());
  }
}

class AuthWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthWidgetState();
  }
}

class AuthWidgetState extends State<AuthWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isInput = true;
  bool isSignIn = true;
  bool isInputMode = true;

  String? email;
  String? password;

  void signIn() async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      print(result);

      if (result.user!.emailVerified) {
        setState(() {
          isInputMode = false;
        });
      } else {
        showToast('인증되지 않은 이메일 입니다');
      }
    } on FirebaseAuthException catch (e) {
      showToast(e.code);
    }
  }

  void signUp() async {
    try {
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      if (result.user!.email != null) {
        FirebaseAuth.instance.currentUser?.sendEmailVerification();
        setState(() {
          isInput = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isInputMode = true;
    });
  }

  List<Widget> getInputWidget() {
    return [
      Text(isSignIn ? "로그인" : "회원가입",
          style: TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center),
      Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return '이메일을 입력하세요.';
                }
                return null;
              },
              onSaved: (String? value) {
                email = value ?? "";
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return '비밀번호를 입력하세요.';
                }
                return null;
              },
              onSaved: (String? value) {
                password = value ?? "";
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    if (isSignIn) {
                      signIn();
                    } else {
                      signUp();
                    }
                  }
                },
                child: Text(isSignIn ? "로그인" : "회원가입")),
            RichText(
                text: TextSpan(
                    text: 'Go: ',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                  TextSpan(
                      text: isSignIn ? "로그인" : "회원가입",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isSignIn = !isSignIn;
                          });
                        })
                ]))
          ]))
    ];
  }

  List<Widget> getResultWidget() {
    String resultEmail =
        FirebaseAuth.instance.currentUser?.email ?? 'Unknown@outlook.com';
    return [
      Text(isSignIn ? '$resultEmail 로 로그인 했습니다.' : '$resultEmail 로 가입했습니다 :)',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
      ElevatedButton(
          onPressed: () {
            if (isSignIn) {
              signOut();
            } else {
              setState(() {
                isInputMode = true;
                isSignIn = true;
              });
            }
          },
          child: Text(isSignIn ? "로그아웃" : "로그인"))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: isInputMode ? getInputWidget() : getResultWidget(),
        ));
  }
}
