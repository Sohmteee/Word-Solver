import 'dart:io';

import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
    var filePath = p.join(Directory.current.path, 'assets', 'dictionary');
    File file = File(filePath);
    List<String> words = await file.readAsLinesSync();
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
