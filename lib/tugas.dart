import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/profile_screen.dart';
import 'package:get/get.dart';

class TugasScreen extends StatefulWidget {
  const TugasScreen({super.key});

  @override
  State<TugasScreen> createState() => _TugasScreenState();
}

class _TugasScreenState extends State<TugasScreen> {
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
                                  "guru 1",
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
                                  "tugas 2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  "guru 2",
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