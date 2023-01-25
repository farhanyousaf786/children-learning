import 'dart:math';

import 'package:children_learning/universalData/dataBase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ColorsName extends StatefulWidget {
  const ColorsName({Key? key}) : super(key: key);

  @override
  _ColorsNameState createState() => _ColorsNameState();
}

class _ColorsNameState extends State<ColorsName> {
  final player = AudioPlayer();
  DataBase dataBase = DataBase();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    player.setUrl(dataBase.colorsNameVoice[currentIndex]);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Colors Name'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        player.setUrl(dataBase.colorsNameVoice[currentIndex]);
                        player.play();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 6,
                                color: dataBase.colorsList[index],
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: dataBase.colorsList[index],
                                  ),
                                  height: 75,
                                  width: 75,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                    child: Text(
                                  dataBase.colorsName[index],
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'sunny',

                                      color:  dataBase.colorsList[index]),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

            ],
          ),
        ));
  }
}
