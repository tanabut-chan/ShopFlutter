import 'package:demoshopapp/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'validations/validation.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Text(
            'Signed In as',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            user.email!,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            label: Text(
              'Sign Out',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ]),
      ),
    );
  }
}
