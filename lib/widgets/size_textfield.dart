import 'package:flutter/material.dart';

class SizeTextField extends StatefulWidget {
  const SizeTextField({Key? key}) : super(key: key);

  final TextEditingController

  @override
  State<SizeTextField> createState() => _SizeTextFielddState();
}

class _SizeTextFielddState extends State<SizeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
            fillColor: Colors.green.shade100,
            border: InputBorder.none,
            hintText: "Min"),
      ),
    );
  }
}
