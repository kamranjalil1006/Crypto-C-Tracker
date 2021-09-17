import 'package:crypto_c_tracker_flutter/Utilities/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_c_tracker_flutter/Coin_Data/Coins_Data.dart';
import 'package:intl/intl.dart';
import 'dart:io' show Platform;

class DisplayPage extends StatefulWidget {
  final coin; // 14. coinName is stored inside coin variable which can be accessed from DisplayPage state class using "widget.coin".
  DisplayPage(this.coin);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  String coin = ''; // 15. Initialized variables
  IconData icon = Icons.notifications_none;
  double? rate;
  String? currency;
  String? currencyName;
  String time = DateFormat.Hms().format(DateTime.now());
  String date = DateFormat.yMd().format(DateTime.now());
  String selectedCurrency = 'USD';

  DropdownButton androidDropDown() {
    //  DropDownButton for Android
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton(
        style: TextStyle(color: Colors.amberAccent, fontSize: 25),
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value.toString();
            fetchCoinData();
          });
        });
  }

  Container iOSPicker() {
    //  DropDownButton for iOS
    List<Text> itemsList = [];
    for (String currency in currenciesList) {
      itemsList.add(Text(currency));
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.grey.shade400,
      ),
      margin: EdgeInsets.symmetric(horizontal: 100),
      child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (value) {
            setState(() {
              selectedCurrency = value.toString();
              fetchCoinData();
            });
          },
          children: itemsList),
    );
  }

  void displayCoinName() {
    // Displaying Coin Names
    if (widget.coin == 'BTC') {
      coin = r'\BitCoin';
    } else if (widget.coin == 'ETH') {
      coin = r'\Ethereum';
    } else if (widget.coin == 'LTC') {
      coin = r'\LiteCoin';
    } else if (widget.coin == 'ETC') {
      coin = r'\Ethereum Classic';
    }
  }

  @override
  void initState() {
    // 16. initState method is called as soon as the page is build
    super.initState();
    displayCoinName(); // 17. displayCoinName function is called to display the initialize the coin variable for displaying
    fetchCoinData(); // 18. Now for fetching the data internet through coin.api, we call this fetchCoinData Method.
  }

  void fetchCoinData() async {
    // 19. fetchCoinData is an async function means it will make a request for the required data through api and then as soon as it is recieved it will store it inside the given dynamic variable.
    try {
      // 20. Here we have used the 'try-catch' technique. First it will perform the body of 'try' and if it is successful then well and good.
      var recievedCoinData =
          await CoinData().getCoinData(widget.coin, selectedCurrency);
      updateUI(
          recievedCoinData); // 21. If the body of 'try' is executed successfully then it will call this function and pass on the value obtained through the api call for updating the UI for user.
    } catch (e) {
      // 21. if the try method is unsuccessful then this method will catch that error and store it inside the 'e' variable and then accordingly printing it in the console.
      print('$e error');
    }
  }

  void updateUI(var data) {
    // 23. Upon receiving 'response.body' , updateUI will store it inside the dynamic variable 'data'.
    setState(() {
      // 24. whenever some action is performed on screen by the user it will automatically refresh the state of the widget.
      if (data == null) {
        // 25. creating an alternate method in case of null value of the variables initialized at 'step: 15'.
        rate = 00;
        currency = 'Unavailable';
        currencyName = '';
      } else {
        // 26. Assigning respective data to the variables, and these variables' data is then presented inside the Scaffold of our application.
        rate = data['rate'];
        currency = rate!.toStringAsFixed(0);
        currencyName = data['asset_id_quote'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Live Exchange Rates', style: TextStyle(fontSize: 20)),
            TextButton(
                onPressed: () {
                  setState(() {
                    icon == Icons.notifications_none
                        ? icon = Icons.notifications_active
                        : icon = Icons.notifications_none;
                  });
                },
                child: Icon(icon, color: Colors.white))
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
                alignment: Alignment.topRight,
                child: Platform.isAndroid ? androidDropDown() : iOSPicker()),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$currency', style: kPriceTextStyle),
                      Text('$currencyName',
                          style: TextStyle(fontSize: 30, color: Colors.white))
                    ],
                  ),
                  Text(
                    '$coin',
                    style: TextStyle(fontSize: 60, color: Colors.amber),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time: $time',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text('Date: $date',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Refresh',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
