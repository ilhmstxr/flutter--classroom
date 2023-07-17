import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/buat_kelas.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:flutter_ilham_todolist/gabung_kelas.dart';
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

      return Padding(
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            print("done");
          },
          child: Container(
            width: boxWidth,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.getKelas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  print(snapshot.data);
                  var data = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].data().containsKey("kelas")
                                        ? data[index]["kelas"]
                                        : "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    data[index].data().containsKey("bagian")
                                        ? data[index]["bagian"]
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              data[index].data().containsKey("ruang")
                                  ? data[index]["ruang"]
                                  : "",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      );
    },
  ),
),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                onClosing: () {},
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.16,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("tambah");
                            Get.to(() => BuatKelas());
                          },
                          child: Text(
                            "Menambah Kelas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            print("gabung");
                            Get.to(() => JoinKelas());
                          },
                          child: Text(
                            "Gabung Kelas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
