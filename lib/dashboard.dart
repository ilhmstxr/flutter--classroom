import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:flutter_ilham_todolist/login.dart';
import 'package:flutter_ilham_todolist/profile_screen.dart';
import 'package:flutter_ilham_todolist/tugas.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardStateScreen();
}

class DashboardStateScreen extends State<DashboardScreen> {
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Classroom",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black87),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              endIndent: 10,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Kelas"),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              endIndent: 10,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("List Tugas"),
              onTap: () {
                Get.to(() => const TugasScreen());
              },
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
                          borderRadius: BorderRadius.circular(5.0)),
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
                                  "guru 1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "tugas 2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  "guru 2",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
