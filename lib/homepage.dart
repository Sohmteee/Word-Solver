import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:word_solver/extra_methods.dart';
import 'package:word_solver/widgets/size_textfield.dart';
import 'data/data.dart';
import 'widgets/display_result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool display = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (result.isNotEmpty)
          ? FloatingActionButton(onPressed: () {})
          : const SizedBox(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: word,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      letters = value;
                      displayResult();
                      build(context);
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.green.shade100,
                    border: InputBorder.none,
                    hintText: "Type in a bunch of letters",
                    hintStyle: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select the size of the output",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              const SizedBox(height: 20),
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
                    onChanged: (String? value) {
                      setState(() {
                        selectedSize = value;
                        displayResult();
                        build(context);
                      });
                    },
                  ),
                  selectedSize == "Range"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizeTextField(
                              controller: min,
                              hintText: "Min",
                            ),
                            SizeTextField(
                              controller: max,
                              hintText: "Max",
                            ),
                          ],
                        )
                      : otherSizeTextField(selectedSize)
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    displayResult();
                    build(context);
                  });
                },
                child: const Text("Generate"),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              Expanded(
                child: displayResult(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

otherSizeTextField(size) {
  switch (size) {
    case "Limit":
      return SizeTextField(
        controller: limit,
        hintText: size,
      );
    case "Exact Value":
      return SizeTextField(
        width: 130,
        controller: exact,
        hintText: size,
      );
    default:
      return const SizedBox();
  }
}
