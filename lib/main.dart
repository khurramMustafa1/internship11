
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internshipproject11/screen/Bottombar.dart' show bottomnavbar;
import 'package:internshipproject11/screen/splash_screen.dart' show splash_screen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: splash_screen(),
      //connection_lost()


    );
  }
}

