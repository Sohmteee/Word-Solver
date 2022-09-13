import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'homepage.dart';

Future<void> main() async {
    var filePath = p.join(Directory.current.path, 'assets', 'dictionary');
    File file = File(filePath);
    List<Future<String>> words = file.readAsLines();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
