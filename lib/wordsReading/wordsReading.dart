import 'dart:collection';
import 'dart:math';

import 'package:children_learning/universalData/dataBase.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
    loadNativeAd();
    AtoZLoadingAd();
  }

  NativeAd? nativeAd;
  bool isNativeAdLoaded = false;

  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-5525086149175557/7943654768",
      factoryId: "listTileMedium",
      listener: NativeAdListener(onAdLoaded: (ad) {
        setState(() {
          isNativeAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        nativeAd!.dispose();
      }),
      request: AdRequest(),
    );
    nativeAd!.load();
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
          title: const Text('A-Z Words'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Center(
                  child: DelayedDisplay(
                    delay: const Duration(milliseconds: 600),
                    slidingBeginOffset: const Offset(0.0, -1),
                    child: Text(
                      dataBase.aForAppleWords[currentIndex],
                      style: TextStyle(
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          fontFamily: 'cutes',
                          fontSize: 50,
                          shadows:
                              dataBase.outlinedText(strokeColor: Colors.black)),
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

                        player
                            .setUrl(dataBase.aForAppleVoiceLinks[currentIndex]);
                        player.play();
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 50,
                        color: currentIndex == 0
                            ? Colors.grey.shade300
                            : Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.network(
                            dataBase.aForAppleLinks[currentIndex]),
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

                        player
                            .setUrl(dataBase.aForAppleVoiceLinks[currentIndex]);
                        player.play();
                      },
                      child: Icon(
                        Icons.chevron_right,
                        size: 50,
                        color: currentIndex == 25
                            ? Colors.grey.shade300
                            : Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment(0, 1.0),
                    child: isNativeAdLoaded
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            height: 300,
                            child: AdWidget(
                              ad: nativeAd!,
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
