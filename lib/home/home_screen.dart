// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_360/application/constants.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 23.0, right: 23.0, top: 0.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height * 0.06,
                child: Image.asset(
                  "assets/images/metas.png",
                ),
              ),
              SizedBox(
                  // height: height * 0.4,
                  width: double.infinity,
                  child: Image.asset("assets/images/vr.png")),
              buildButton(context, "Mickey Mouse", "Mario"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String firstVideoName, String secondVideoName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.orangeAccent, width: 2.0)),
              ),
              onPressed: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => const FirstVideo()));
                _launchURL();
              },
              child: Text(
                firstVideoName,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.orangeAccent, width: 2.0)),
              ),
              onPressed: () {
                _launchURL();
              },
              child: Text(
                secondVideoName,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(Constants.videoUrl)) throw 'Could not launch ${Constants.videoUrl}';
  }
}
