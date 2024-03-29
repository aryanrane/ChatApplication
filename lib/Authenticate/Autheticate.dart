import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:chat_app/Authenticate/LoginScree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/dashboard_screen.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return DashboardScreen();
    } else {
      return LoginScreen();
    }
  }
}
