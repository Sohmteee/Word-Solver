import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'display_result.dart';

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
