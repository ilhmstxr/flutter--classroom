import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_ilham_todolist/dashboard.dart';
import 'package:flutter_ilham_todolist/login.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const LoginScreen(),
      // home: DashboardScreen(),
    );
  }
}

//

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     Future<FirebaseApp> _initializeFirebase() async {
//       FirebaseApp firebaseApp = await Firebase.initializeApp();
//       return firebaseApp;
//     }

//     return Scaffold(
//       body: FutureBuilder(
//           // stream: controller.login(),
//           future: _initializeFirebase(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return LoginScreen();
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   static Future<User?> loginUsingEmailPassword(
//       {required String email,
//       required String password,
//       required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         Get.snackbar("failed", "user not found");
//       } else if (e.code == null) {
//         Get.snackbar("failed", "something wrong");
//       }

//       return user;
//     }
//   }

//   final controller = Get.put(FirebaseConnection());
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "MyApp Title",
//             style: TextStyle(
//                 color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             "Login to your app",
//             style: TextStyle(
//                 color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 44.0,
//           ),
//           TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//               hintText: "User email",
//               prefixIcon: Icon(
//                 Icons.mail,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 26,
//           ),
//           TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//               hintText: "Text Password",
//               prefixIcon: Icon(Icons.lock),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: Text(
//               "forgot yout password?",
//               style: TextStyle(color: Colors.blue),
//             ),
//           ),
//           // const
//           const SizedBox(
//             height: 88,
//           ),
//           Container(
//             width: double.infinity,
//             child: RawMaterialButton(
//               fillColor: Color(0xFF0069FE),
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               onPressed: () async {
//                 User? user = await loginUsingEmailPassword(
//                     email: controller.textemail,
//                     password: controller.textpassword,
//                     context: context);
//                 print(user);
//                 if (user != null) {
//                   Get.to(() => const ProfileScreen());
//                 }
//               },
//               child: const Text(
//                 "Login",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
