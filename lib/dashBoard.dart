import 'dart:async';

import 'package:children_learning/123Reading/123Reading.dart';
import 'package:children_learning/123Writing/123Writing.dart';
import 'package:children_learning/ColorsName/colorsName.dart';
import 'package:children_learning/abcReading/abcReading.dart';
import 'package:children_learning/abcWriting/abcWriting.dart';
import 'package:children_learning/wordsReading/wordsReading.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isBDMusicPlaying = true;
  bool hiText = true;
  String bgMusic =
      "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/BGMusic%2Fyt5s.com%20-%20%5BNo%20Copyright%20Music%5D%20Cute%20Wiggling%20Baby%20Background%20Music%20(128%20kbps).mp3?alt=media&token=7b1bb28d-65ac-4158-b9cb-e76c53bafafd";
  final player = AudioPlayer();
  Timer? timer;
  int maxAttempts = 5;

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize();

    player.setUrl(bgMusic);
    player.play();
    timer = Timer.periodic(
        const Duration(milliseconds: 8500), (Timer t) => sayHi());
    loadStaticBannerAd();
    loadInlineBannerAd();
    //   createInterstialAd();
    //   createRewardedAd();
  }

  sayHi() {
    if (hiText) {
      setState(() {
        hiText = false;
      });
    }
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        hiText = true;
      });
    });
  }

  late BannerAd staticAd;
  bool staticAdLoaded = false;
  late BannerAd inlineAd;
  bool inlineAdLoaded = false;

  InterstitialAd? interstitialAd;
  int interstitialAttempts = 0;

  RewardedAd? rewardedAd;
  int rewardedAdAttempts = 0;

  ///Ad request settings
  static const AdRequest request = AdRequest(
      // keywords: ['', ''],
      // contentUrl: '',
      // nonPersonalizedAds: false
      );

  ///function to load static banner ad
  void loadStaticBannerAd() {
    staticAd = BannerAd(
        adUnitId: 'ca-app-pub-5525086149175557/2147382119',
        size: AdSize.banner,
        request: request,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            staticAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();

          print('ad failed to load ${error.message}');
        }));

    staticAd.load();
  }

  ///function to load inline banner ad
  void loadInlineBannerAd() {
    inlineAd = BannerAd(
        adUnitId: 'ca-app-pub-5525086149175557/2147382119',
        size: AdSize.banner,
        request: request,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            inlineAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();

          print('ad failed to load ${error.message}');
        }));

    inlineAd.load();
  }

  ///function to create Interstitial ad
  void createInterstialAd() {
    InterstitialAd.load(
        adUnitId: InterstitialAd.testAdUnitId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          interstitialAd = ad;
          interstitialAttempts = 0;
        }, onAdFailedToLoad: (error) {
          interstitialAttempts++;
          interstitialAd = null;
          print('falied to load ${error.message}');

          if (interstitialAttempts <= maxAttempts) {
            createInterstialAd();
          }
        }));
  }

  ///function to show the Interstitial ad after loading it
  ///this function will get called when we click on the button
  void showInterstitialAd() {
    if (interstitialAd == null) {
      print('trying to show before loading');
      return;
    }

    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createInterstialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print('failed to show the ad $ad');

          createInterstialAd();
        });

    interstitialAd!.show();
    interstitialAd = null;
  }

  ///function to create rewarded ad
  void createRewardedAd() {
    RewardedAd.load(
        adUnitId: RewardedAd.testAdUnitId,
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          rewardedAd = ad;
          rewardedAdAttempts = 0;
        }, onAdFailedToLoad: (error) {
          rewardedAdAttempts++;
          rewardedAd = null;
          print('failed to load ${error.message}');

          if (rewardedAdAttempts <= maxAttempts) {
            createRewardedAd();
          }
        }));
  }

  ///function to show the rewarded ad after loading it
  ///this function will get called when we click on the button
  void showRewardedAd() {
    if (rewardedAd == null) {
      print('trying to show before loading');
      return;
    }

    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print('failed to show the ad $ad');

          createRewardedAd();
        });

    rewardedAd!.show(onUserEarnedReward: (ad, reward) {
      print('reward video ${reward.amount} ${reward.type}');
    });
    rewardedAd = null;
  }

  _launchURL() async {
    if (await canLaunch(
        "https://sites.google.com/view/childreneducationapp/home")) {
      await launch("https://sites.google.com/view/childreneducationapp/home");
    } else {
      throw 'Could not launch ${"https://sites.google.com/view/childreneducationapp/home"}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=> {_launchURL()},
          child: const Icon(
            Icons.info_outline,
            color: Colors.green,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Childrens ",
              style: TextStyle(
                  fontFamily: 'cutes', color: Colors.pinkAccent, fontSize: 22),
            ),
            Text(
              "Learning",
              style: TextStyle(
                  fontFamily: 'cutes',
                  color: Colors.yellow.shade700,
                  fontSize: 22),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (isBDMusicPlaying) {
                setState(() {
                  isBDMusicPlaying = false;
                  player.stop();
                });
              } else {
                setState(() {
                  isBDMusicPlaying = true;
                  player.play();
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12, top: 4, bottom: 4),
              child: Icon(
                isBDMusicPlaying
                    ? Icons.notifications_active_outlined
                    : Icons.notifications_off,
                color: Colors.deepOrange,
                size: 21,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        DelayedDisplay(
                          delay: const Duration(seconds: 1),
                          slidingBeginOffset: const Offset(0.0, 1),
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/Gifs%2Fwave1.gif?alt=media&token=2898af2b-16f7-4c28-9512-e271a3f7b89b",
                            fit: BoxFit.contain,
                            scale: 2,
                          ),
                        ),
                        Positioned(
                            left: 170,
                            top: 25,
                            child: Text(
                              hiText ? "Hi" : "",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'cutes',
                                  fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 2, right: 2),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              player.stop();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ABCReading()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 4, top: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 3.8,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/abc1.jpg",
                                      scale: 15,
                                    ),
                                    const Text(
                                      "Reading Letters",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              player.stop();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ABCWriting()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 8, top: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 3.8,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/abc2.jpg",
                                      scale: 15,
                                    ),
                                    const Text(
                                      "Writing Letters",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              player.stop();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OneTwoThreeReading()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 4, top: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 3.8,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/123a.jpg",
                                      scale: 15,
                                    ),
                                    const Text(
                                      "Reading Numbers",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              player.stop();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OneTwoThreeWriting()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 8, top: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 3.8,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/123Board.jpg",
                                      scale: 15,
                                    ),
                                    const Text(
                                      "Writing Numbers",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              player.stop();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WordsReading()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 4, top: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 3.8,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/AforApple.jpg",
                                      scale: 15,
                                    ),
                                    const Text(
                                      "A-Z Words",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pinkAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              player.stop();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ColorsName()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 8, top: 8, bottom: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 3.8,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/colorsBoard.jpg",
                                      scale: 15,
                                    ),
                                    const Text(
                                      "Colors Name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (staticAdLoaded)
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  child: AdWidget(
                    ad: staticAd,
                  ),
                  width: staticAd.size.width.toDouble(),
                  height: staticAd.size.height.toDouble(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
