import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
            height: MediaQuery.of(context).size.height / 1.1,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Colors.white),
                        onPressed: () => {
                              _launchURL(),
                            },
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.blue),
                        )),
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
                                  setAgree(context),
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

  mustAgree(BuildContext context) {
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
                        "Must Have to Agree to use the App",
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
                                  setAgree(context),
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

  setAgree(BuildContext context) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setString("agree", "true");
    Navigator.pop(context);
  }

  setDisagree() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setString("agree", "false");
    SystemNavigator.pop();
  }

  _launchURL() async {
    if (await canLaunch(
        "https://sites.google.com/view/childreneducationapp/home")) {
      await launch("https://sites.google.com/view/childreneducationapp/home");
    } else {
      throw 'Could not launch ${"https://sites.google.com/view/childreneducationapp/home"}';
    }
  }
}
