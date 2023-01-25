import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class NaturalScreen extends StatefulWidget {
//   const NaturalScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NaturalScreen> createState() => _NaturalScreenState();
// }
//
// class _NaturalScreenState extends State<NaturalScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class NeutralScreen {
  popUp(BuildContext context) {
    return showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: false,
        enableDrag: false,
        isDismissible: false,
        barrierColor: Colors.red.withOpacity(0.2),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 1.5,
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
                        "Confirm Age and Policy",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "This app is designed for Kids to learn basic Numbers and Alphabetic."
                        " So, here you please confirm by pressing agree button that you agree "
                        "with our term and services and allow Children under 13 to use this App Game",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () => {
                                  setAgree(),
                                },
                            child: const Text("I Agree")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () => {
                                  setDisagree(),
                                },
                            child: const Text("Not Agree")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  setAgree() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setString("agree", "true");
  }

  setDisagree() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setString("agree", "false");
  }
}
