import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/login.dart';
import 'package:flutter_ilham_todolist/profile_screen.dart';
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

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user; 

      firestore.collection("user").add({
        "email" : email, 
        "password" : password, 
      });

      if (user != null) {
        print("User has been made");
      } else {
        print("failed");
      }
    } catch (e) {}
  }

  RxBool eyes = false.obs;
  void showpw() {
    eyes.value = !eyes.value;
  }

  // Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
  //   return firestore.collection("user").snapshots();
  // }
  void getData() {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      String? useremail = user.email;
      String? username = user.displayName;
      // String role = user;
    }
  }

  FutureOr<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(() => const Dashboard());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("email", "user not found");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("error", "wrong password");
      } else {
        Get.snackbar('error', 'Error: ${e.message}');
      }
    }
  }

  void delete(String document) {
    firestore.collection("user").doc(document).delete();
  }
}
