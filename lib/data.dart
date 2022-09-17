import 'package:flutter/material.dart';

TextEditingController word;
final min = TextEditingController();
final max = TextEditingController();
final limit = TextEditingController();
final exact = TextEditingController();
final all = TextEditingController();
List<String> sizes = [
  "Range",
  "Limit",
  "Exact Value",
  "All",
];
String? selectedSize = sizes[0];
