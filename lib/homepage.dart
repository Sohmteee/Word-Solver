import 'dart:io';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    File file = File("assets/dictionary");
    List<String> words = file.readAsLinesSync();
    final controller = ScrollController();

    return Scaffold(
      body: SafeArea(
        child: ,
      ),
    );
  }
}
