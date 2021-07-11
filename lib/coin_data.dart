import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD', 'BRL', 'CAD', 'CNY', 'EUR', 'GBP',
  'HKD', 'IDR', 'ILS', 'INR', 'JPY', 'MXN',
  'NOK', 'NZD', 'PLN', 'RON', 'RUB', 'SEK',
  'SGD', 'USD', 'ZAR', 'LAK'
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC' ,'XLM', 'BNB','CRV','XRP','TRX',];
//// 'WAVES','XRP','ANKR','CRV', 'ENJ','AAVE'

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = ' A4E3D940-E4FF-4946-B737-518A75F1F9EB';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        //print(decodedData);
        double price = decodedData['rate'];
        var time= decodedData['time'];
        String date = time.substring(0,10);
        String samay = time.substring(11,19);
        print(time+price.toStringAsFixed(0));
        cryptoPrices[crypto] = time+price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}

