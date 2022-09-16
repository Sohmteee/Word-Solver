import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              //textfield for the letters
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
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
                              width: 100.w,
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
                                    hintText: "Min"),
                              ),
                            ),
                            Container(
                              width: 100.w,
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
                                    hintText: "Max"),
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
