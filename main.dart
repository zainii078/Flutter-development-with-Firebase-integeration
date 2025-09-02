import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Web aur Mobile dono ke liye support
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAfVi_JMPRdu9tGK3myfX4BkJUjg7es3Xs",
      authDomain: "flutter-project-50805.firebaseapp.com",
      databaseURL: "https://flutter-project-50805-default-rtdb.firebaseio.com",
      projectId: "flutter-project-50805",
      storageBucket: "flutter-project-50805.firebasestorage.app",
      messagingSenderId: "671987984275",
      appId: "1:671987984275:web:6d16afd57fd6452a5eaa66",
      measurementId: "G-D2QT0CF6X1",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Realtime DB")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            saveUserData("Zain", "zain@example.com");
          },
          child: const Text("Save Data to Firebase"),
        ),
      ),
    );
  }
}

final dbRef = FirebaseDatabase.instance.ref();

void saveUserData(String name, String email) {
  dbRef.child("users").push().set({
    "name": name,
    "email": email,
  });
}
