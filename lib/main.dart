import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_in_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Firebase Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SigninPage(),
    ),
  );
}
