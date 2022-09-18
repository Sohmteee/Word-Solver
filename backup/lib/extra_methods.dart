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