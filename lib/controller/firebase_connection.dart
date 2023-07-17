import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/dashboard.dart';
import 'package:get/get.dart';

class FirebaseConnection extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final loginemail = TextEditingController();
  final loginpassword = TextEditingController();

  final registeremail = TextEditingController();
  final registerpassword = TextEditingController();

  Future<bool> check(String email) async {
    try {
      List<String> signInMethods =
          await _auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

// menggunakkan firebase auth
  // Future<void> register(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     User? user = userCredential.user;

  //     firestore.collection("user").add({
  //       "email": email,
  //       "password": password,
  //     });

  //     if (user != null) {
  //       print("User has been made");
  //     } else {
  //       print("failed");
  //     }
  //   } catch (e) {}
  // }

  // FutureOr<void> login(String email, String password) async {
  //   try {
  //     // await getUser().first;
  //     // UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //     // email: email, password: password);
  //     Get.to(() => const Dashboard());
  //   } on FirebaseException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Get.snackbar("email", "user not found");
  //     } else if (e.code == 'wrong-password') {
  //       Get.snackbar("error", "wrong password");
  //     } else {
  //       Get.snackbar('error', 'Error: ${e.message}');
  //     }
  //   }
  // }

  RxBool eyes = false.obs;
  void showpw() {
    eyes.value = !eyes.value;
  }

  // Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
  //   return firestore.collection("user").snapshots();
  // }
  // void getData() {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     String uid = user.uid;
  //     String? useremail = user.email;
  //     String? username = user.displayName;
  //   }
  // }

  // Stream<QuerySnapshot<Map<String, dynamic>>> getUser() {
  //   return firestore.collection("user").snapshots();
  // }

// login
  Future<void> login(String email, String password) async {
    final user = firestore.collection("user");

    final snapshot = await user
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      Get.to(() => const DashboardScreen());
    } else {
      Get.snackbar("error", "Invalid Credentials");
    }
  }

// delete user
  void delete(String document) {
    firestore.collection("user").doc(document).delete();
  }

// register
  Future<void> register(String email, String password) async {
    final regist = firestore.collection("user");

    final user = await regist.doc(email).get();
    if (!user.exists) {
      // user.add({"email": email, "password": password});
      await regist.doc(email).set({
        "email": email,
        "password": password,
      });
    } else {
      Get.snackbar("error", "email has been used");
    }
  }

  final buat_kelas = TextEditingController();
  final buat_bagian = TextEditingController();
  final buat_ruang = TextEditingController();
  final buat_mapel = TextEditingController();

  Future<void> BuatKelas(
    String kelas,
    String bagian,
    String ruang,
    String mapel,
  ) async {
    firestore.collection("kelas").add({
      "kelas": kelas,
      "bagian": bagian,
      "ruang": ruang,
      "mapel": mapel,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getKelas() {
    return firestore.collection("kelas").snapshots();
  }
}
