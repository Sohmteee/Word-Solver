import 'data/data.dart';

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
      if (wordMap[letter.toLowerCase()]! > lettersMap[letter.toLowerCase()]!) {
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

int checkLongestWordLength() {
  int l = 0;

  for (var listOfWords in result) {
    for (var word in listOfWords) {
      if (word.length > l) l = word.length;
    }
  }

  return l;
}
