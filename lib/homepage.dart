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
    final word = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: word,
              decoration: InputDecoration(
                autofocus: true,
                  onChanged: (value) => setState(() {
                    gitExists = Directory("$path\\.git").existsSync();
                    path = value.trim();
                  }),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.white,

                    //add prefix icon
                    prefixIcon: IconButton(
                      onPressed: () async {
                        path = await FlutterDesktopFolderPicker
                            .openFolderPickerDialog();
                        setState(() {
                          gitExists = Directory("$path\\.git").existsSync();
                          debugPrint("Path: $path");
                          dir.text = path!;
                        });
                      },
                      hoverColor: Colors.white,
                      icon: const Icon(
                        Icons.folder,
                        color: Colors.grey,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    errorText: (dir.text.trim() == "" || path == null)
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
                    labelText: 'Project Directory',

                    //label style
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  
              ),
            ),
          ],
        ),
      ),
    );
  }
}
