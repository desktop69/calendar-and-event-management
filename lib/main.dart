import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'eventsdoc/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(),
      home: HomePage(),
    );
    // SingleChildScrollView
    // Scaffold
  }
}
