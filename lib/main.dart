import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_sample/auth/myauth.dart';
import 'package:flutter_firebase_auth_sample/pages/home.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_in_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Firebase Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return SigninPage();
              } else {
                return Home();
              }
            }
            return CircularProgressIndicator();
          },
        )),
  );
}

Future<FirebaseUser> getUser() async {
  return await MyAuth().getCurrentUser();
}
