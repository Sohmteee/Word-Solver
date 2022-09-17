import 'package:flutter/cupertino.dart';

Map<Characters, int> getCharacterCount(String letters) {
  Map<Characters, int> countLetters = {};
  countLetters['e'] = 2;

  for (int i = 0; i < letters.length(); i++) {
    char currentLetter = letters.charAt(i);
    int count = countLetters.getOrDefault(currentLetter, 0);
    countLetters.put(currentLetter, count + 1);
  }

  return countLetters;
}
