// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:word_solver/data/data.dart';
import 'package:word_solver/data/english_words.dart';
import 'package:word_solver/extra_methods.dart';

Future<void> method() async {
  print("Hello World");
}

Widget displayResult() {
  List<String> r = [];
  if (letters != "") {
    lettersMap = getCharacterCount(letters.toLowerCase());
    print(letters);
    print(lettersMap);

    if (((min.text.trim() != "" && min.text.trim().isNotEmpty) &&
            (max.text.trim() != "" && max.text.trim().isNotEmpty)) ||
        (limit.text.trim() != "" && limit.text.trim().isNotEmpty) ||
        (exact.text.trim() != "" && exact.text.trim().isNotEmpty)) {
      switch (selectedSize) {
        case "Range":
          if ((int.tryParse(min.text.trim()) != null) &&
              (int.tryParse(max.text.trim()) != null)) {
            size = [int.parse(min.text.trim()), int.parse(max.text.trim())];
          }
          break;
        case "Limit":
          if ((int.tryParse(limit.text.trim()) != null)) {
            size = int.tryParse(limit.text.trim());
          }
          break;
        case "Exact Value":
          if ((int.tryParse(exact.text.trim()) != null)) {
            size = int.tryParse(exact.text.trim());
          }
          break;
        default:
          size = 31;
          break;
      }
    } else {
      return const Center(
        child: Text("No word matches your parameters"),
      );
    }

    if (size != null) {
      if ((size.runtimeType == List<int>) || (size.runtimeType == int)) {
        if (size.runtimeType == List<int>) {
          result = [];

          for (int i = size[0]; i <= size[1]; i++) {
            r = [];
            for (String word in englishWords) {
              if (word.length == i) {
                bool can = canMakeCurrentWord(word);

                if (can) {
                  r.add(word);
                }
              }
            }
            if (r.isNotEmpty) result.add(r);
          }
        } else {
          switch (selectedSize) {
            case "Limit":
              result = [];
              for (int i = 2; i <= size; i++) {
                r = [];
                for (String word in englishWords) {
                  if (word.length == i) {
                    bool can = canMakeCurrentWord(word);

                    if (can) {
                      r.add(word);
                    }
                  }
                }
                if (r.isNotEmpty) result.add(r);
              }
              break;
            case "Exact Value":
              result = [];
              r = [];
              for (String word in englishWords) {
                if (word.length == size) {
                  bool can = canMakeCurrentWord(word);

                  if (can) {
                    r.add(word);
                  }
                }
              }
              if (r.isNotEmpty) result.add(r);
              break;
            case "All":
              result = [];
              for (int i = 2; i <= size; i++) {
                r = [];
                for (String word in englishWords) {
                  if (word.length == i) {
                    bool can = canMakeCurrentWord(word);

                    if (can) {
                      r.add(word);
                    }
                  }
                }
                if (r.isNotEmpty) result.add(r);
              }
              break;
          }
        }
      } else {
        return const Center(
          child: Text("No word matches your parameters"),
        );
      }
    } else {
      return const Center(
        child: Text("No word matches your parameters"),
      );
    }
  } else {
    return const Center(
      child: Text("No word matches your parameters"),
    );
  }

  print(result.length);

  if (result.isNotEmpty) {
    return PageView.builder(
      itemCount: result.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        try {
          return Scaffold(
            body: Column(
              children: [
                Text(
                  "${result[index][0].length} letter words",
                  style: TextStyle(fontSize: 20.sp),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: result[index]
                        .map((word) => ListTile(
                              title: Center(
                                child: Text(word),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        } catch (e) {
          return const Center(
            child: Text("No word matches your parameters"),
          );
        }
      },
    );
  } else {
    return const Center(
      child: Text("No word matches your parameters"),
    );
  }
}
