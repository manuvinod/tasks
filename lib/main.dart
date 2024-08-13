import 'package:flutter/material.dart';

import '09-08-24/Task1.dart';
import '09-08-24/Task10.dart';
import '09-08-24/Task2.dart';
import '09-08-24/Task3.dart';
import '09-08-24/Task4.dart';
import '09-08-24/Task5.dart';
import '09-08-24/Task6.dart';
import '09-08-24/Task9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PersonScreen(),
    );
  }
}