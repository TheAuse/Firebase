import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/admin_panel/login.dart';
import 'package:firebase_login/user_panel/homepage.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Homepage();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
