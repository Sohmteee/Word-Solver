import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Future<Widget> build(BuildContext context) {
    final word = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: word,
              autofocus: true,
              onChanged: (value) => setState(() {}),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,

                //add prefix icon
                prefixIcon: IconButton(
                  onPressed: () async {},
                  hoverColor: Colors.white,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,
                errorText: (word.text.trim() == "")
                    ? "Choose or paste the directory of your project"
                    : null,
                hintText: "Paste directory to your project",

                //make hint text
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),

                //create label
                labelText: 'Letters',

                //label style
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
