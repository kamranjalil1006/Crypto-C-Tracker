import 'package:crypto_c_tracker_flutter/Coin_Data/Coins_Data.dart';
import 'package:crypto_c_tracker_flutter/Screens/Display_Page.dart';
import 'package:crypto_c_tracker_flutter/Utilities/Constants.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String coinInfoDisplay = 'Click To Read Me First';
  String? coinName;

  DropdownButton infoDropButton() {
    //06. Function created for Android information button
    List<DropdownMenuItem<String>> itemsList =
        []; //07. Empty list is created for storing items.
    for (String coinInfo in cryptoCoinsNameList) {
      //08. For loop is executed for retrieving items from Coin_Data and stored in itemsList.
      var newitem = DropdownMenuItem(child: Text(coinInfo), value: coinInfo);
      itemsList.add(newitem);
    }
    return DropdownButton(
        //09. DropdownButton widget is returned.
        items: itemsList,
        value: coinInfoDisplay,
        onChanged: (value) {
          //10. Nothing is deployed in function as this is used only for displaying info
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Crypto-C Tracker',
            style: TextStyle(
                color: Colors.amber, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFF15141F),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                    alignment: Alignment.topCenter, child: infoDropButton()),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    child: TextField(
                      //11. TextField Widget for Getting CoinName from User.
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration,
                      onChanged: (value) {
                        coinName = value
                            .toString(); //12. Storing the user input in coinName variable.
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF50524F)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DisplayPage(
                            coinName); //13. Navigated towards Display Screen along with the Coin Name.
                      }));
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
