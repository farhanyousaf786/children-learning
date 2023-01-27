import 'package:children_learning/universalData/dataBase.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:story_painter/story_painter.dart';

class ABCWriting extends StatefulWidget {
  const ABCWriting({Key? key}) : super(key: key);

  @override
  _ABCWritingState createState() => _ABCWritingState();
}

class _ABCWritingState extends State<ABCWriting> {
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
    player.setAsset(dataBase.alphabetsVoice[currentIndex]);
    Future.delayed(const Duration(milliseconds: 1500), () {
      player.setAsset(dataBase.alphabetsVoice[currentIndex]);
      player.play();
    });
    loadNativeAd();
    loadAbcWritingInterAd();
  }

  NativeAd? nativeAd;
  bool isNativeAdLoaded = false;

  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-5525086149175557/9588743073",
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
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        abcWritingInter.show();
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Writing Practice'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  slidingBeginOffset: const Offset(0.0, -1),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Stack(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                dataBase.dotedAlphabetsLinks[currentIndex],
                                fit: BoxFit.fill,
                              ),
                            )),
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
                        player.setAsset(dataBase.alphabetsVoice[currentIndex]),
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
                                builder: (context) => const ABCWriting()));
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
                          itemCount: dataBase.alphabetsCharacter.length,
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
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      player.setAsset(dataBase
                                          .alphabetsVoice[currentIndex]);
                                      player.play();
                                    });
                                  }),
                                },
                                child: SizedBox(
                                  width: 75,
                                  child: Material(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 5,
                                    child: Center(
                                        child: Text(
                                      dataBase.alphabetsCharacter[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
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
