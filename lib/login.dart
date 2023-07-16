import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:flutter_ilham_todolist/profile_screen.dart';
import 'package:flutter_ilham_todolist/register.dart';
import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

// }

// statefull widget

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(FirebaseConnection());
  final _keylogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "login",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _keylogin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.loginemail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "User Email",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your email';
                  } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              TextFormField(
                controller: controller.loginpassword,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Text Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_keylogin.currentState!.validate()) {
                      controller.login(controller.loginemail.text,
                          controller.loginpassword.text);
                    }
                  },
                  child: Text("login")),
              GestureDetector(
                onTap: () {
                  Get.to(() => RegisterScreen());
                },
                child: Text(
                  "Dont have an account?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
