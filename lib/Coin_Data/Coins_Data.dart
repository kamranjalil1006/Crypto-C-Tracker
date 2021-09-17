import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = 'E0A52B61-8539-4E8F-88CA-BD724055636D';
const String apiURL = 'https://rest.coinapi.io/v1/exchangerate/';

class CoinData {
  Future getCoinData(String selectedCoin, String selectedCurrency) async {
    var data;
    http.Response response = await http.get(
        Uri.parse('$apiURL$selectedCoin/$selectedCurrency?apikey=$apiKey'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      print('${response.statusCode} error');
    }
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoCoinsNameList = [
  'Click To Read Me First',
  'For BitCoin Enter BTC',
  'For Ethereum Enter ETH',
  'For Ethereum Classic Enter ETC',
  'For LiteCoin Enter LTC',
];
