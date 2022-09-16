import 'package:flutter/material.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //textfield for the letters
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: word,
                  autofocus: true,
                  decoration: InputDecoration(
                      fillColor: Colors.green.shade100,
                      border: InputBorder.none,
                      hintText: "Type in a bunch of letters"),
                ),
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Select the size of the output"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    value: selectedSize,
                    items: sizes
                        .map((size) => DropdownMenuItem<String>(
                              value: size,
                              child: Text(size),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      selectedSize = value as String?;
                    }),
                  ),
                  selectedSize == "Range"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 70,
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                controller: word,
                                autofocus: true,
                                decoration: InputDecoration(
                                    fillColor: Colors.green.shade100,
                                    border: InputBorder.none,
                                    hintText: "Type in a bunch of letters"),
                              ),
                            ),
                            Container(
                              width: 70,
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                controller: word,
                                autofocus: true,
                                decoration: InputDecoration(
                                    fillColor: Colors.green.shade100,
                                    border: InputBorder.none,
                                    hintText: "Type in a bunch of letters"),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: word,
                            autofocus: true,
                            decoration: InputDecoration(
                                fillColor: Colors.green.shade100,
                                border: InputBorder.none,
                                hintText: "Type in a bunch of letters"),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
