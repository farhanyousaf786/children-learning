import 'dart:async';
import 'package:children_learning/123Reading/123Reading.dart';
import 'package:children_learning/123Writing/123Writing.dart';
import 'package:children_learning/ColorsName/colorsName.dart';
import 'package:children_learning/Natural%20Screen/NaturalScreen.dart';
import 'package:children_learning/abcReading/abcReading.dart';
import 'package:children_learning/abcWriting/abcWriting.dart';
import 'package:children_learning/wordsReading/wordsReading.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late Container adContainer;

  @override
  void initState() {
    super.initState();
    player.setUrl(bgMusic);
    player.play();
    timer = Timer.periodic(
        const Duration(milliseconds: 8500), (Timer t) => sayHi());
    loadAbcReadingInterAd();
    loadAbcWritingInterAd();
    // loadNumberReadingAd();
    loadNumberWritingAd();
    AtoZLoadingAd();
    // colorLoadingAd();
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
    Future.delayed(const Duration(seconds: 60), () {
      abcReadingInter.show();
    });
    Future.delayed(const Duration(seconds: 10), () {
      notify();
    });
    Future.delayed(const Duration(seconds: 2), () {
      neutralScreen();
    });
  }

  neutralScreen() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("agree")) {
      if (prefs.getString("agree") == "true") {
      } else {
        NeutralScreen neutralScreen = NeutralScreen();



      }
    } else {
      NeutralScreen neutralScreen = NeutralScreen();
      neutralScreen.popUp(context);
    }
  }

  notify() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("internet")) {
      if (prefs.getString("internet") == "false") {
      } else {
        bottomBar();
      }
    } else {
      bottomBar();
    }
  }

  bottomBar() {
    return showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        barrierColor: Colors.red.withOpacity(0.2),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.linear_scale_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    color: Colors.green,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Important Note",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Wifi or Internet is Necessary for better Experience",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        onPressed: () => {
                              neverShowAgain(),
                            },
                        child: const Text("Never Show Again")),
                  )
                ],
              ),
            ),
          );
        });
  }

  neverShowAgain() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setString("internet", "false");
    Navigator.pop(context);
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

  _launchURL() async {
    if (await canLaunch(
        "https://sites.google.com/view/childreneducationapp/home")) {
      await launch("https://sites.google.com/view/childreneducationapp/home");
    } else {
      throw 'Could not launch ${"https://sites.google.com/view/childreneducationapp/home"}';
    }
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-5525086149175557/5317491428',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
  late InterstitialAd abcReadingInter;

  void loadAbcReadingInterAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-5525086149175557/3238107087",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          setState(() {
            abcReadingInter = ad;
          });
        },
        onAdFailedToLoad: (err) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ABCReading()));
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  late InterstitialAd abcWritingInter;

  void loadAbcWritingInterAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-5525086149175557/4527988080",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          setState(() {
            abcWritingInter = ad;
          });
        },
        onAdFailedToLoad: (err) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ABCReading()));
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  // late InterstitialAd numberReading;
  // void loadNumberReadingAd() {
  //   InterstitialAd.load(
  //     adUnitId: "ca-app-pub-3940256099942544/1033173712",
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (ad) {},
  //         );
  //         setState(() {
  //           numberReading = ad;
  //         });
  //       },
  //       onAdFailedToLoad: (err) {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => const OneTwoThreeReading()));
  //         print('Failed to load an interstitial ad: ${err.message}');
  //       },
  //     ),
  //   );
  // }

  late InterstitialAd numberWriting;

  void loadNumberWritingAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-5525086149175557/6985780408",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );
          setState(() {
            numberWriting = ad;
          });
        },
        onAdFailedToLoad: (err) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OneTwoThreeWriting()));
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WordsReading()));
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  // late InterstitialAd colorInter;
  // void colorLoadingAd() {
  //   InterstitialAd.load(
  //     adUnitId: "ca-app-pub-3940256099942544/1033173712",
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (ad) {},
  //         );
  //         setState(() {
  //           colorInter = ad;
  //         });
  //       },
  //       onAdFailedToLoad: (err) {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => const ColorsName()));
  //         print('Failed to load an interstitial ad: ${err.message}');
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => {_launchURL()},
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
        child: Column(
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
                      ),
                    ),
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
                        abcReadingInter.show();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ABCReading(),
                          ),
                        );
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
                        abcWritingInter.show();
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
                        aTozInter.show();
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OneTwoThreeReading(),
                            ),
                          );
                        });
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
                        numberWriting.show();

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
                        aTozInter.show();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WordsReading(),
                          ),
                        );
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
                        numberWriting.show();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: adContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
