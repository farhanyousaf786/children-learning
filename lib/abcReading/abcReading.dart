import 'package:children_learning/universalData/dataBase.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ABCReading extends StatefulWidget {
  const ABCReading({Key? key}) : super(key: key);

  @override
  _ABCReadingState createState() => _ABCReadingState();
}

class _ABCReadingState extends State<ABCReading> {
  int currentIndex = 0;
  final player = AudioPlayer();
  DataBase dataBase = DataBase();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      player.setAsset(dataBase.alphabetsVoice[currentIndex]);
      player.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Reading Practice'),
          centerTitle: true,
        ),
        body: Center(
          child: Center(
            child: Column(
              children: [
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  slidingBeginOffset: const Offset(0.0, -1),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          dataBase.simpleAlphabetsLinks[currentIndex],
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
                SizedBox(
                  height: 130,
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2Fkids1.jpg?alt=media&token=a5e945af-7503-4ca3-b4ac-f36f6efdbd66"),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataBase.alphabetsCharacter.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                currentIndex = index;
                              }),
                              Future.delayed(const Duration(seconds: 1), () {
                                player.setAsset(
                                    dataBase.alphabetsVoice[currentIndex]);
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
                                  dataBase.alphabetsCharacter[index],
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
              ],
            ),
          ),
        ));
  }
}
