import 'dart:collection';
import 'dart:math';

import 'package:children_learning/universalData/dataBase.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';

class OneTwoThreeReading extends StatefulWidget {
  const OneTwoThreeReading({Key? key}) : super(key: key);

  @override
  _OneTwoThreeReadingState createState() => _OneTwoThreeReadingState();
}

class _OneTwoThreeReadingState extends State<OneTwoThreeReading> {
  final player = AudioPlayer();
  DataBase dataBase = DataBase();

  @override
  void initState() {
    super.initState();
    player.setAsset("assets/countingVoice/en_num_1.mp3");
    player.play();
    AtoZLoadingAd();
  }



  late InterstitialAd aTozInter;

  void AtoZLoadingAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-5525086149175557/3214906418",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          setState(() {
            aTozInter = ad;
          });
        },
        onAdFailedToLoad: (err) {

          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        aTozInter.show();
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          title: const Text('Reading 123'),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              100,
              (index) {
                return GestureDetector(
                  onTap: () {
                    player
                        .setAsset("assets/countingVoice/en_num_${index + 1}.mp3");
                    player.play();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 6,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          shadows:
                              dataBase.outlinedText(strokeColor: Colors.black),
                          fontSize: 120,
                          fontFamily: 'sunny',
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        ),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
