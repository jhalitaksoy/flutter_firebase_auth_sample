import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_sample/auth/myauth.dart';
import 'package:flutter_firebase_auth_sample/pages/sign_in_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void onSignOut() {
    MyAuth().signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return SigninPage();
        },
      ),
    );
  }

  Future<FirebaseUser> getUser() async {
    var user = await MyAuth().getCurrentUser();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return buildUserCard(snapshot.data);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Card buildUserCard(FirebaseUser user) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 20),
            Text(user.email),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onSignOut,
            ),
          ],
        ),
      ),
    );
  }
}
