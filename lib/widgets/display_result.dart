import 'package:flutter/material.dart';
import 'package:word_solver/data/data.dart';
import 'package:word_solver/data/english_words.dart';
import 'package:word_solver/extra_methods.dart';

Widget displayResult() {
  List<String> r = [];
  if (letters != "") {
    Map<String, int> lettersMap = getCharacterCount(letters.toLowerCase());
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
          for (String word in englishWords) {
            if (word.length >= size[0] && word.length <= size[1]) {
              bool canMakeCurrentWord = true;
              Map<String, int> wordMap = getCharacterCount(word.toLowerCase());

              for (String letter in wordMap.keys) {
                if (lettersMap.containsKey(letter)) {
                  if (wordMap[letter.toLowerCase()]! >
                      lettersMap[letter.toLowerCase()]!) {
                    canMakeCurrentWord = false;
                    break;
                  }
                } else {
                  canMakeCurrentWord = false;
                  break;
                }
              }

              if (canMakeCurrentWord) {
                r.add(word);
              }
            }
            result = r;
          }
        } else {
          switch (selectedSize) {
            case "Limit":
              for (String word in englishWords) {
                if (word.length <= size) {
                  bool canMakeCurrentWord = true;
                  Map<String, int> wordMap =
                      getCharacterCount(word.toLowerCase());

                  for (String letter in wordMap.keys) {
                    if (lettersMap.containsKey(letter)) {
                      if (wordMap[letter.toLowerCase()]! >
                          lettersMap[letter.toLowerCase()]!) {
                        canMakeCurrentWord = false;
                        break;
                      }
                    } else {
                      canMakeCurrentWord = false;
                      break;
                    }
                  }

                  if (canMakeCurrentWord) {
                    r.add(word);
                  }
                }
                result = r;
              }
              break;
            case "Exact Value":
              for (String word in englishWords) {
                if (word.length == size) {
                  bool canMakeCurrentWord = true;
                  Map<String, int> wordMap =
                      getCharacterCount(word.toLowerCase());

                  for (String letter in wordMap.keys) {
                    if (lettersMap.containsKey(letter)) {
                      if (wordMap[letter.toLowerCase()]! >
                          lettersMap[letter.toLowerCase()]!) {
                        canMakeCurrentWord = false;
                        break;
                      }
                    } else {
                      canMakeCurrentWord = false;
                      break;
                    }
                  }

                  if (canMakeCurrentWord) {
                    r.add(word);
                  }
                }
                result = r;
              }
              break;
            case "All":
              for (String word in englishWords) {
                bool canMakeCurrentWord = true;
                Map<String, int> wordMap =
                    getCharacterCount(word.toLowerCase());

                for (String letter in wordMap.keys) {
                  if (lettersMap.containsKey(letter)) {
                    if (wordMap[letter.toLowerCase()]! >
                        lettersMap[letter.toLowerCase()]!) {
                      canMakeCurrentWord = false;
                      break;
                    }
                  } else {
                    canMakeCurrentWord = false;
                    break;
                  }
                }

                if (canMakeCurrentWord) {
                  r.add(word);
                }

                result = r;
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

  return result.isNotEmpty
      ? ListView(
          children: result
              .map(
                (word) => ListTile(
                  title: Center(
                    child: Text(word),
                  ),
                ),
              )
              .toList(),
        )
      : const Center(
          child: Text("No word matches your parameters"),
        );
}
