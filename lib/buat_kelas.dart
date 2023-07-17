import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:get/get.dart';

class BuatKelas extends StatefulWidget {
  const BuatKelas({super.key});

  @override
  State<BuatKelas> createState() => _BuatKelasState();
}

class _BuatKelasState extends State<BuatKelas> {
  bool isFocused = false;
  final controller = Get.put(FirebaseConnection());
  final key_kelas = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("buat kelas"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: () {
                if (key_kelas.currentState!.validate()) {
                  controller.BuatKelas(
                          controller.buat_kelas.text,
                          controller.buat_bagian.text,
                          controller.buat_ruang.text,
                          controller.buat_mapel.text)
                      .then((value) {
                    controller.buat_kelas.clear();
                    controller.buat_bagian.clear();
                    controller.buat_ruang.clear();
                    controller.buat_mapel.clear();
                  });
                  Get.snackbar("success", "a class has been built");
                }
              },
              child: Text("Buat"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: key_kelas,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AnimatedContainer(
                //   duration: Duration(milliseconds: 200),
                //   height: isFocused ? 40 : 60,
                //   alignment: Alignment.bottomLeft,
                //   child: Text(
                //     isFocused ? 'nama kelas (wajib)' : 'nama kelas (wajib)',
                //     style: TextStyle(
                //       fontSize: isFocused ? 12 : 20,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),
                TextFormField(
                  controller: controller.buat_kelas,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'the class mus been filled';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'Nama kelas',
                  ),
                  onTap: () {
                    setState(() {
                      isFocused = true;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      isFocused = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      isFocused = value.isNotEmpty;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.buat_bagian,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'Bagian',
                  ),
                  onTap: () {
                    setState(() {
                      isFocused = true;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      isFocused = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      isFocused = value.isNotEmpty;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.buat_ruang,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'Ruang',
                  ),
                  onTap: () {
                    setState(() {
                      isFocused = true;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      isFocused = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      isFocused = value.isNotEmpty;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.buat_mapel,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'Mata Pelajaran',
                  ),
                  onTap: () {
                    setState(() {
                      isFocused = true;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      isFocused = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      isFocused = value.isNotEmpty;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class BuatKelas extends StatelessWidget {
//   BuatKelas({super.key});


 
// }
