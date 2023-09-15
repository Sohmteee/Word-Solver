import 'package:flutter/material.dart';

import '../data/english_words.dart';

class WordProvider extends ChangeNotifier {
  final word = TextEditingController();
  final min = TextEditingController();
  final max = TextEditingController();
  final limit = TextEditingController();
  final exact = TextEditingController();
  final pageController = PageController();

  List<String> sizes = [
    "Range",
    "Limit",
    "Exact Value",
    "All",
  ];

  String? selectedSize = "Range";
  String letters = "";
  Map<String, int> lettersMap = {};
  List<List<String>> result = [];
  List<String> nLetterWords = [];
  dynamic size;
  int resultIndex = 0;

  Map<String, int> getCharacterCount(String letters) {
    Map<String, int> countLetters = {};

    for (int i = 0; i < letters.length; i++) {
      String currentLetter = letters[i];
      countLetters.containsKey(letters[i])
          ? countLetters.update(currentLetter, (value) => value + 1)
          : countLetters[letters[i]] = 1;
    }

    return countLetters;
  }

  bool canMakeCurrentWord(word) {
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

    return canMakeCurrentWord;
  }


  bool validSize() =>
      ((min.text.trim().isNotEmpty && max.text.trim().isNotEmpty) ||
          limit.text.trim().isNotEmpty ||
          exact.text.trim().isNotEmpty ||
          selectedSize == "All");

  void updateSize() {
    if ((min.text.trim().isNotEmpty && max.text.trim().isNotEmpty) ||
        limit.text.trim().isNotEmpty ||
        exact.text.trim().isNotEmpty ||
        selectedSize == "All") {
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
    }
    notifyListeners();
  }

  void computeResult() {
    if (size is List<int>) {
      result.clear();

      for (int i = size[0]; i <= size[1]; i++) {
        nLetterWords = englishWords
            .where((word) => (word.length == i && canMakeCurrentWord(word)))
            .toList();

        if (nLetterWords.isNotEmpty) result.add(nLetterWords);
      }
    } else {
      switch (selectedSize) {
        case "Limit":
          result.clear();

          for (int i = 2; i <= size; i++) {
            nLetterWords = englishWords
                .where((word) => (word.length == i && canMakeCurrentWord(word)))
                .toList();

            if (nLetterWords.isNotEmpty) result.add(nLetterWords);
          }

          break;
        case "Exact Value":
          result.clear();

          nLetterWords = englishWords
              .where(
                  (word) => (word.length == size && canMakeCurrentWord(word)))
              .toList();

          if (nLetterWords.isNotEmpty) result.add(nLetterWords);

          break;
        case "All":
          result.clear();

          for (int i = 2; i <= size; i++) {
            nLetterWords = englishWords
                .where((word) => (word.length == i && canMakeCurrentWord(word)))
                .toList();

            if (nLetterWords.isNotEmpty) result.add(nLetterWords);
          }

          break;
      }
    }
    debugPrint("Result length: ${result.length}");
    // notifyListeners();
  }

  void displayResult() {
    if (letters.trim() != "") {
      letters = letters.replaceAll(" ", "");

      lettersMap = getCharacterCount(letters.toLowerCase());

      if (!validSize()) {
        debugPrint("Valid Size: ${validSize()}");
      }

      if (size != null) {
        debugPrint("Size: $size");
        if ((size is List<int>) || (size is int)) {
          computeResult();
        } else {
          debugPrint(
              "No word matches your parameters (size isn't a list or int)");
        }
      } else {
        debugPrint("No word matches your parameters (size is null)");
      }
    } else {
      debugPrint("No word matches your parameters (letters is empty)");
    }

    if (result.isNotEmpty) {
      debugPrint(result.length.toString());
    } else {
      debugPrint("No word matches your parameters (result is empty)");
    }
    notifyListeners();
  }

}
