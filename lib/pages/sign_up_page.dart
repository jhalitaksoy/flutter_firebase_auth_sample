import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_base.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_in_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends SignBase<SignupPage> {
  String email = "", password1 = "", password2 = "";

  void onSignupTap() {
    print(email);
    print(password1);
    print(password2);
  }

  void onSigninTap() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return SigninPage();
        },
      ),
    );
  }

  void onChangeEmail(String text) {
    setState(() {
      email = text;
    });
  }

  void onChangePassword1(String text) {
    setState(() {
      password1 = text;
    });
  }

  void onChangePassword2(String text) {
    setState(() {
      password2 = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: buildCard(buildFormContent()),
        ),
      ),
    );
  }

  Column buildFormContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildTitle("Sign up"),
        SizedBox(height: 20),
        buildTextFormField("Email", onChangeEmail),
        SizedBox(height: 10),
        buildTextFormField("Password", onChangePassword1),
        SizedBox(height: 10),
        buildTextFormField("Password Again", onChangePassword2),
        SizedBox(height: 20),
        buildBottomRow([
          buildFlatButton("Sign in", onSigninTap),
          buildButton("Sign up", Colors.orange, onSignupTap),
        ]),
      ],
    );
  }
}
