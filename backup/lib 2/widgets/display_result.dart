// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:word_solver/data/data.dart';
import 'package:word_solver/data/english_words.dart';
import 'package:word_solver/extra_methods.dart';

Widget displayResult() {
  List<String> r = [];
  if (letters != "") {
    lettersMap = getCharacterCount(letters.toLowerCase());
    print(letters);
    print(lettersMap);

    if ((min.text.trim() != "" && min.text.trim().isNotEmpty) &&
        (max.text.trim() != "" && max.text.trim().isNotEmpty)) {
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
      }
    } else {
      return const Center(
        child: Text("No word matches your parameters"),
      );
    }

    print(size.runtimeType);

    if (size != null) {
      if ((size.runtimeType == List<int>) || (size.runtimeType == int)) {
        if (size.runtimeType == List<int>) {
          result = [];

          for (int i = size[0]; i <= size[1]; i++) {
            for (String word in englishWords) {
              if (word.length == i) {
                bool can = canMakeCurrentWord(word);

                if (can) {
                  r.add(word);
                }
              }
            }
            result.add(r);
          }
        } else {
          switch (selectedSize) {
            case "Limit":
              result = [];
              for (int i = 1; i <= size; i++) {
                for (String word in englishWords) {
                  if (word.length == i) {
                    bool can = canMakeCurrentWord(word);

                    if (can) {
                      r.add(word);
                    }
                  }
                }
                result.add(r);
              }
              break;
            case "Exact Value":
              result = [];
              for (String word in englishWords) {
                if (word.length == size) {
                  bool can = canMakeCurrentWord(word);

                  if (can) {
                    r.add(word);
                  }
                }
                result.add(r);
              }
              break;
            case "All":
              result = [];
              for (int i = 1; i <= size; i++) {
                for (String word in englishWords) {
                  if (word.length == i) {
                    bool can = canMakeCurrentWord(word);

                    if (can) {
                      r.add(word);
                    }
                  }
                }
                result.add(r);
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

  print(result);

  return result.isNotEmpty
      ? ListView(
          children: result
              .map((listOfWords) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.yellow,
                          height: 200,
                          child: ListView(
                            children: listOfWords
                                .map(
                                  (word) => ListTile(
                                    title: Center(
                                      child: Text(word),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ))
              .toList(),
        )
      : const Center(
          child: Text("No word matches your parameters"),
        );
}
