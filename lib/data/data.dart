import 'package:flutter/material.dart';

final word = TextEditingController();
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
String? letters = "";
List<int> range = [];
int size = 0;