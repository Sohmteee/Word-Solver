import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data.dart';

class SizeTextField extends StatefulWidget {
  const SizeTextField({Key? key}) : super(key: key);

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
        controller: word,
        autofocus: true,
        decoration: InputDecoration(
            fillColor: Colors.green.shade100,
            border: InputBorder.none,
            hintText: "Min"),
