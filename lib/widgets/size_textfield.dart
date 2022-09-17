import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:word_solver/data/data.dart';

class SizeTextField extends StatefulWidget {
  const SizeTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.width = 80,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double width;

  @override
  State<SizeTextField> createState() => _SizeTextFielddState();
}

class _SizeTextFielddState extends State<SizeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: widget.controller,
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) => setState(() {
          switch (selectedSize) {
            case "Range":
              size = [int.parse(min.text.trim()), int.parse(max.text.trim())];
              break;
            case "Limit":
              size = int.parse(limit.text.trim());
              break;
            case "Exact Value":
              size = int.parse(exact.text.trim());
              break;
            case "All":
              size = int.parse(all.text.trim());
              break;
          }
          displayResult();
        }),
        decoration: InputDecoration(
          fillColor: Colors.green.shade100,
          border: InputBorder.none,
          hintText: widget.hintText,
          labelText: widget.hintText,
        ),
      ),
    );
  }
}
