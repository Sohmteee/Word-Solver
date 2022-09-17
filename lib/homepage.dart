import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:word_solver/extra_methods.dart';
import 'package:word_solver/widgets/size_textfield.dart';
import 'data/data.dart';
import 'data/english_words.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool display = false;
  @override
  Widget build(BuildContext context) {
    Widget displayResult() {
      if (letters != "") {
        Map<String, int> lettersMap = getCharacterCount(letters.toLowerCase());
        print(letters);
        print(lettersMap);

        for (String word in englishWords) {
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

          if (canMakeCurrentWord) {
            result.add(word);
          }
        }

        if ((size.runtimeType == List<int>) || (size.runtimeType == int)) {
          switch (selectedSize) {
            case "Range":
              size = [int.parse(min.text.trim()), int.parse(max.text.trim())];
              break;
            case "Limit":
              size = int.parse(limit.text.trim());
              break;
            case "Exact Value":
              size = int.parse(exact.text.trim());
              break;
            case "All":
              size = int.parse(all.text.trim());
              break;
          }

          // if (size.runtimeType == List<int>) {
          //   for (String word in englishWords) {
          //     if (word.length >= size[0] && word.length <= size[1]) {

          //       result.add(word);
          //     }
          //   }
          // }
        }
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: word,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      letters = value;
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.green.shade100,
                    border: InputBorder.none,
                    hintText: "Type in a bunch of letters",
                    hintStyle: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select the size of the output",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    value: selectedSize,
                    items: sizes
                        .map((size) => DropdownMenuItem<String>(
                              value: size,
                              child: Text(size),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value as String?;
                        displayResult();
                      });
                    },
                  ),
                  selectedSize == "Range"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizeTextField(
                              controller: min,
                              hintText: "Min",
                            ),
                            SizeTextField(
                              controller: max,
                              hintText: "Max",
                            ),
                          ],
                        )
                      : otherSizeTextField(selectedSize)
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  display = true;
                },
                child: const Text("Generate"),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              Expanded(
                child: displayResult(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

otherSizeTextField(size) {
  switch (size) {
    case "Limit":
      return SizeTextField(
        controller: limit,
        hintText: size,
      );
    case "Exact Value":
      return SizeTextField(
        width: 130,
        controller: exact,
        hintText: size,
      );
    default:
      return const SizedBox();
  }
}
