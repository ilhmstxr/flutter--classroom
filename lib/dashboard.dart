import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:flutter_ilham_todolist/login.dart';
import 'package:flutter_ilham_todolist/profile_screen.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final controller = Get.put(FirebaseConnection());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile user",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Profile());
              },
              icon: CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
                backgroundColor: Colors.white,
              ))
        ],
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Text('back'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Sign out"),
                      content: Text("apakah anda yakin?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.offAll(() => const LoginScreen());
                            },
                            child: Text("logout"))
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
