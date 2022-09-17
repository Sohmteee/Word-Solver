Map<String, int> getCharacterCount(String letters) {
  Map<String, int> countLetters = {};

  for (int i = 0; i < letters.length; i++) {
    String currentLetter = letters[i];
    int? count = countLetters[currentLetter];
    countLetters.put(currentLetter, count + 1);
  }

  return countLetters;
}
