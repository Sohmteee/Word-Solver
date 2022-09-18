import 'package:flutter/material.dart';

final word = TextEditingController();
final min = TextEditingController();
final max = TextEditingController();
final limit = TextEditingController();
final exact = TextEditingController();

List<String> sizes = [
  "Range",
  "Limit",
  "Exact Value",
  "All",
];

String? selectedSize = sizes[0];
String letters = "";
Map<String, int> lettersMap = {};
List<List<String>> result = [];
dynamic size;
