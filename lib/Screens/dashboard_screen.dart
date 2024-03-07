import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Authenticate/Methods.dart';
import '../group_chats/group_chat_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  //final controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Welcome!',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logOut(context),
            color: Colors.black,
          )
        ],
        backgroundColor: Color.fromARGB(255, 246, 245, 245),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, RouteName.policies);
                },
                child: const Text('Government Policies',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff242424)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, RouteName.forums);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => GroupChatHomeScreen()));
                },
                child: const Text(
                  'Forums',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff242424)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
