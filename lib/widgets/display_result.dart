// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:word_solver/providers/word_provider.dart';

import '../data/data.dart';
import 'circle_tab_indicator.dart';

class DisplayResult extends StatefulWidget {
  const DisplayResult({super.key});

  @override
  State<DisplayResult> createState() => _DisplayResultState();
}

class _DisplayResultState extends State<DisplayResult>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WordProvider>(builder: (context, wordProvider, _) {
      if (wordProvider.letters.trim() != "") {
        wordProvider.letters = wordProvider.letters.replaceAll(" ", "");

        wordProvider.lettersMap =
            wordProvider.getCharacterCount(wordProvider.letters.toLowerCase());
        print(wordProvider.letters);
        print(wordProvider.lettersMap);

        if (!wordProvider.validSize()) {
          debugPrint("Valid Size: ${wordProvider.validSize()}");
          return const Center(
            child: Text("No word matches your parameters"),
          );
        }

        if (wordProvider.size != null) {
          debugPrint("Size: ${wordProvider.size}");
          if ((wordProvider.size is List<int>) || (wordProvider.size is int)) {
            wordProvider.computeResult();
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

      if (wordProvider.result.isNotEmpty) {
        tabController =
            TabController(length: wordProvider.result.length, vsync: this);

        return Column(
          children: [
            TabBar(
              tabs: wordProvider.result
                  .map((nLetterWords) => Tab(
                        child: Column(
                          children: [
                            Text(
                              "${nLetterWords[0].length} letter words",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "(${nLetterWords.length})",
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              controller: tabController,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              labelColor: Colors.blueGrey,
              unselectedLabelColor: Colors.blueGrey.withOpacity(0.3),
              indicator: const CircleTabIndicator(
                color: Colors.blueGrey,
              ),
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  return states.contains(MaterialState.focused)
                      ? null
                      : Colors.transparent;
                },
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: wordProvider.result.map((result) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: result.map((word) {
                      return ListTile(
                        dense: true,
                        leading: Text(
                          (result.indexOf(word) + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text(
                          word,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      } else {
        return const Center(
          child: Text("No word matches your parameters"),
        );
      }
    });
  }
}
