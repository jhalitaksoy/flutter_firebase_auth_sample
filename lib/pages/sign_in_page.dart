import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_sample/auth/myauth.dart';
import 'package:flutter_firebase_auth_sample/pages/home.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_base.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_up_page.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends SignBase<SigninPage> {
  String email = "", password = "";

  void onSigninTap() async {
    await MyAuth().signIn(email, password);
    var user = await MyAuth().getCurrentUser();

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
    }
  }

  void onSignupTap() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return SignupPage();
        },
      ),
    );
  }

  void onChangeEmail(String text) {
    setState(() {
      email = text;
    });
  }

  void onChangePassword(String text) {
    setState(() {
      password = text;
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
        buildTitle("Sign in"),
        SizedBox(height: 20),
        buildTextFormField(
          "Email",
          onChangeEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10),
        buildTextFormField(
          "Password",
          onChangePassword,
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        SizedBox(height: 20),
        buildBottomRow([
          buildFlatButton("Sign up", onSignupTap),
          buildButton("Sign in", Colors.orange, onSigninTap),
        ]),
      ],
    );
  }
}
