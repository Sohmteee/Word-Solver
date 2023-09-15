import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:word_solver/data/data.dart';
import 'package:word_solver/data/english_words.dart';
import 'package:word_solver/providers/word_provider.dart';
import 'package:word_solver/widgets/size_textfield.dart';

import 'widgets/display_result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool display = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    otherSizeTextField(size, context) {
      final wordProvider = Provider.of<WordProvider>(context);
      switch (size) {
        case "Limit":
          return SizeTextField(
            focusNode: limitFocus,
            controller: wordProvider.limit,
            textInputAction: TextInputAction.done,
            hintText: size,
          );
        case "Exact Value":
          return SizeTextField(
            focusNode: exactFocus,
            width: 110,
            controller: wordProvider.exact,
            textInputAction: TextInputAction.done,
            hintText: size,
          );
        default:
          return const SizedBox();
      }
    }

    return Consumer<WordProvider>(builder: (context, wordProvider, _) {
      return Scaffold(
        floatingActionButton:
            (wordProvider.result.length > 1 && wordProvider.result.isNotEmpty)
                ? MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blueGrey,
                    child: const Text(
                      "Swipe horizontally to see more words",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : const SizedBox(),
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
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: EasyAutocomplete(
                    focusNode: lettersFocus,
                    controller: wordProvider.word,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    suggestions: englishWords,
                    suggestionTextStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                    onChanged: (value) {
                      setState(() {
                        // lettersHaveChanged = true;
                        wordProvider.letters = value;
                      });
                    },
                    onSubmitted: (value) {
                      switch (wordProvider.selectedSize) {
                        case "Range":
                          FocusScope.of(context).requestFocus(minFocus);
                          break;
                        case "Limit":
                          FocusScope.of(context).requestFocus(limitFocus);
                          break;
                        case "Exact Value":
                          FocusScope.of(context).requestFocus(exactFocus);
                          break;
                        default:
                          break;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.green.shade100,
                      border: InputBorder.none,
                      hintText: "Type in a bunch of letters",
                      hintStyle: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
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
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      borderRadius: BorderRadius.circular(10),
                      value: wordProvider.selectedSize,
                      underline: const SizedBox(),
                      items: wordProvider.sizes
                          .map((size) => DropdownMenuItem<String>(
                                value: size,
                                child: Text(size),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          wordProvider.selectedSize = value;
                          wordProvider.updateSize();
                        });
                      },
                    ),
                    if (wordProvider.selectedSize != "All")
                      wordProvider.selectedSize == "Range"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizeTextField(
                                  focusNode: minFocus,
                                  controller: wordProvider.min,
                                  hintText: "Min",
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (value) => FocusScope.of(context)
                                      .requestFocus(maxFocus),
                                ),
                                SizeTextField(
                                  focusNode: maxFocus,
                                  controller: wordProvider.max,
                                  textInputAction: TextInputAction.done,
                                  hintText: "Max",
                                ),
                              ],
                            )
                          : otherSizeTextField(
                              wordProvider.selectedSize, context)
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      wordProvider.resultIndex = 0;
                      wordProvider.updateSize();
                      wordProvider.displayResult();
                      build(context);
                    });
                  },
                  child: const Text("Generate"),
                ),
                const SizedBox(height: 20),
                const Expanded(
                  child: DisplayResult(),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
