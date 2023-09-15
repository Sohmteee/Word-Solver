import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeTextField extends StatefulWidget {
  const SizeTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.width = 80,
    this.focusNode,
    this.onSubmitted,
    this.textInputAction,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double width;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;

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
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        autofocus: true,
        textAlign: TextAlign.center,
        textInputAction: widget.textInputAction,
        keyboardType: TextInputType.number,
        onChanged: (value) => setState(() {}),
        onSubmitted: (value) => widget.onSubmitted,
        decoration: InputDecoration(
          fillColor: Colors.green.shade100,
          border: InputBorder.none,
          labelText: widget.hintText,
        ),
      ),
    );
  }
}
