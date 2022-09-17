import 'package:flutter/cupertino.dart';

Map<Characters, Integer> getCharacterCount(String letters) {
        Map<Character, Integer> countLetters = new HashMap<>();

        for (int i = 0; i < letters.length(); i++) {
            char currentLetter = letters.charAt(i);
            int count = countLetters.getOrDefault(currentLetter, 0);
            countLetters.put(currentLetter, count + 1);
        }

        return countLetters;
    }