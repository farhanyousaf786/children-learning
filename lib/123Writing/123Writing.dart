import 'package:children_learning/universalData/dataBase.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:story_painter/story_painter.dart';

class OneTwoThreeWriting extends StatefulWidget {
  const OneTwoThreeWriting({Key? key}) : super(key: key);

  @override
  _OneTwoThreeWritingState createState() => _OneTwoThreeWritingState();
}

class _OneTwoThreeWritingState extends State<OneTwoThreeWriting> {
  int currentIndex = 0;
  final player = AudioPlayer();
  DataBase dataBase = DataBase();

  StoryPainterControl painterControl = StoryPainterControl(
    type: PainterDrawType.shape,
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
    color: Colors.black,
    width: 3,
    onDrawStart: () {},
    onDrawEnd: () {},
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      player.setAsset("assets/countingVoice/en_num_1.mp3");
      player.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Writing Practice'),
          centerTitle: true,
        ),
        body: Center(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            DelayedDisplay(
              delay: const Duration(seconds: 1),
              slidingBeginOffset: const Offset(0.0, -1),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${currentIndex + 1}",
                          style: const TextStyle(
                            fontSize: 222,
                            fontFamily: 'doted',
                          ),
                        ),
                      ),
                    ),
                    StoryPainter(
                      control: painterControl,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => {
                    player.setAsset(
                        "assets/countingVoice/en_num_${currentIndex + 1}.mp3"),
                    player.play(),
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          "Speak",
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.record_voice_over_outlined,
                          color: Colors.pinkAccent,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    painterControl.undo();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Remove",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "images/eraser.png",
                          scale: 15,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OneTwoThreeWriting()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.refresh_sharp,
                          color: Colors.deepPurple,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                heightFactor: 15,
                child: SizedBox(
                  height: 75,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                currentIndex = index;
                                for (int i = 0; i <= 40; i++) {
                                  painterControl.undo();
                                }
                                player.setAsset(
                                    "assets/countingVoice/en_num_${index + 1}.mp3");
                                player.play();
                              }),
                            },
                            child: SizedBox(
                              width: 70,
                              child: Material(
                                borderRadius: BorderRadius.circular(15),
                                elevation: 5,
                                child: Center(
                                    child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green,
                                      fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ]),
        )));
  }
}
