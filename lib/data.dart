import 'package:flutter/material.dart';

final word = TextEditingController();
final min = TextEditingController();
final max = TextEditingController();
List<String> sizes = [
  "Range",
  "Limit",
  "Exact Value",
  "All",
];
String? selectedSize = sizes[0];
