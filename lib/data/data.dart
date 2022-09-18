import 'package:flutter/material.dart';
import 'package:word_solver/extra_methods.dart';

import 'english_words.dart';

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
List<String> result = [];
dynamic size;


