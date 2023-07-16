import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  RxBool isBioEditing = false.obs;

  void update() {
    isBioEditing.value = !isBioEditing.value;
  }

  @override
  Widget build(BuildContext context) {
    if (isBioEditing.value == false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("welcome to profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "ilham",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Visibility(
                          visible: !isBioEditing.value,
                          child: ElevatedButton(
                            onPressed: () {
                              print(isBioEditing.value);
                              update();
                            },
                            child: Text("update bio"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("welcome to profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Enter your name"),
                    onChanged: (value) {},
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              print(isBioEditing.value);
                              update();
                            },
                            child: Text("Cancel")),
                        ElevatedButton(onPressed: () {}, child: Text("Update")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
