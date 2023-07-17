import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:flutter_ilham_todolist/kelas.dart';
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
          "List Tugas",
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
            ),
            ListTile(
              leading: Icon(Icons.class_),
              title: Text("kelas"),
              onTap: () {
                Get.to(() => KelasScreen());
              },
              // selected: widget.currentPage == "Dashboard",
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
        child: Builder(
          builder: (context) {
            double screenWidth = MediaQuery.of(context).size.width;
            double boxWidth = screenWidth * 0.95;

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      print("done");
                    },
                    child: Container(
                      width: boxWidth,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "tugas 1 ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  "dosen 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "13 - 03 - 2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      print("done");
                    },
                    child: Container(
                      width: boxWidth,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "tugas 1 ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  "dosen 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "13 - 03 - 2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
