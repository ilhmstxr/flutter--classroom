import 'package:flutter/material.dart';
import 'package:flutter_ilham_todolist/controller/firebase_connection.dart';
import 'package:flutter_ilham_todolist/login.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.put(FirebaseConnection());
  final _keyregister = GlobalKey<FormState>();
  RxBool v = false.obs;
  void tampil() {
    v.value = !v.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _keyregister,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.registeremail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "input your email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insert your email";
                  } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please enter a valid email");
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: 26,
              ),
              TextFormField(
                obscureText: controller.eyes.value,
                controller: controller.registerpassword,
                decoration: InputDecoration(
                  hintText: "input your password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        controller.eyes.value = !controller.eyes.value;
                      });
                    },
                    icon: Icon(controller.eyes.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insert your password";
                  } else
                    // if (value.length < 6) {
                    //   return "password must be more than 6 characters long";
                    // }
                    return null;
                },
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_keyregister.currentState!.validate()) {
                    // if (await controller.check(controller.registeremail.text)) {
                    controller
                        .register(controller.registeremail.text,
                            controller.registerpassword.text)
                        .then((value) {
                      controller.registeremail.clear();
                      controller.registerpassword.clear();
                    });

                    // menggunakkan firebase auth
                    // controller.register(controller.registeremail.text,
                    //     controller.registerpassword.text);
                    // Get.snackbar("success", "account has been made");
                    // tampil();
                    //   } else {
                    //     Get.snackbar("failed", "another user using this email");
                    //   }
                    // } else {
                    //   Get.snackbar("failed", "please fill the form");
                  }
                },
                child: Text("register"),
              ),
              // Visibility(
              //   visible: v.value ? true : false,
              //   child: ElevatedButton.icon(
              //     onPressed: () {
              //       Get.to(() => LoginScreen());
              //     },
              //     icon: Icon(Icons.login),
              //     label: Text("login"),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
