import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  String email = "", password = "";

  void onSigninTap() {
    print(email);
    print(password);
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
          child: buildLoginCard(),
        ),
      ),
    );
  }

  Card buildLoginCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
        child: Form(
          child: buildFormContent(),
        ),
      ),
    );
  }

  Column buildFormContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildLoginTitle(),
        SizedBox(height: 20),
        buildTextFormField("Email", onChangeEmail),
        SizedBox(height: 10),
        buildTextFormField("Password", onChangePassword),
        SizedBox(height: 20),
        buildLoginButton(),
      ],
    );
  }

  Align buildLoginTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Sign in",
        style: TextStyle(
          fontSize: 32,
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
    String hintText,
    Function(String text) onChange,
  ) {
    return TextFormField(
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        hintText: hintText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  RaisedButton buildLoginButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.orange,
      onPressed: onSigninTap,
      child: Text(
        "Sign in",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
