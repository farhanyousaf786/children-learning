import 'dart:collection';
import 'dart:math';

import 'package:children_learning/universalData/dataBase.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:story_painter/story_painter.dart';

class WordsReading extends StatefulWidget {
  const WordsReading({Key? key}) : super(key: key);

  @override
  _WordsReadingState createState() => _WordsReadingState();
}

class _WordsReadingState extends State<WordsReading> {
  int currentIndex = 0;

  final player = AudioPlayer();
  DataBase dataBase = DataBase();

  @override
  void initState() {
    super.initState();
    player.setUrl(dataBase.aForAppleVoiceLinks[currentIndex]);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('A-Z Words'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
             Container(height: MediaQuery.of(context).size.height/6,),
            Center(
              child: DelayedDisplay(
                delay: const Duration(milliseconds: 600),
                slidingBeginOffset: const Offset(0.0, -1),
                child: Text(
                  dataBase.aForAppleWords[currentIndex],
                  style: TextStyle(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      fontFamily: 'cutes',
                      fontSize: 50,
                      shadows: dataBase.outlinedText(strokeColor: Colors.black)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (currentIndex == 0) {
                    } else {
                      setState(() {
                        currentIndex--;
                      });
                    }

                    player.setUrl(dataBase.aForAppleVoiceLinks[currentIndex]);
                    player.play();
                  },
                  child:  Icon(
                    Icons.chevron_left,
                    size: 50,
                    color: currentIndex == 0 ? Colors.grey.shade300 :  Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                      child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(dataBase.aForAppleLinks[currentIndex]),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentIndex == 25) {
                    } else {
                      setState(() {
                        currentIndex++;
                      });
                    }

                    player.setUrl(dataBase.aForAppleVoiceLinks[currentIndex]);
                    player.play();
                  },
                  child:  Icon(
                    Icons.chevron_right,
                    size: 50,
                    color: currentIndex == 25 ? Colors.grey.shade300 :  Colors.blue,

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
