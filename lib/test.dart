import 'dart:io';

import 'package:flutter/cupertino.dart';

Future<void> main(List<String> args) async {
  var filePath = "assets/dictionary";
  File file = File(filePath);
  List<String> words = await file.readAsLines();

  debugPrint(words[0]);
}
