import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:crypto_c_tracker_flutter/Screens/Search_Page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // 03. initState is called Whenever an application is restarted.
    super.initState();
    Timer(Duration(seconds: 04), () {
      // 04. SplashScreen will remain active for given time.
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SearchPage(); // 05. After given time it will Navigate towards Search Screen.
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/SplashScreenImage.PNG'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Crypto-C Tracker',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            'Kamran Jalil',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.amber),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SpinKitRing(
                        size: 100,
                        color: Colors.amber.shade200,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Loading...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[200]),
                      ),
                    ],
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
