import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  static const String id = "price_scr";
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList)
    {
      var str = coinValues[crypto];
      var price = str!=null?str.substring(28):"wait";
      var time = str!=null?str.substring(11,19):"wait";
      var date = str!=null?str.substring(0,10):"wait";
      cryptoCards.add(
          CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : price.toString(),
            date: date,
            time: time,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('💰 Krypto'),
        backgroundColor: Color(0xFF191414),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF191414),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SingleChildScrollView(child: makeCards())),
            Container(
              //height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
//            color: Colors.yellow,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff99ff66),Color(0xff1DB954),]),
                borderRadius: BorderRadiusDirectional.circular(10.0),
              ),
              child: Column(
                children:<Widget>[
                  Text("Select your Currency",style:TextStyle(color:Colors.white,fontSize: 20),),
                  Platform.isIOS ? iOSPicker() : androidDropdown(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
   CryptoCard({
    this.value,
    this.selectedCurrency,
    this.cryptoCurrency,
    this.date,
    this.time
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;
  final String date;
  final String time;
  String fullName;
  @override
  Widget build(BuildContext context) {
    if(cryptoCurrency == "BTC")
      fullName = "Bitcoin";
    else if(cryptoCurrency == "ETH")
      fullName="Ethereum";
    else if(cryptoCurrency == "LTC")
      fullName="Litecoin";
    else if(cryptoCurrency == "XLM")
      fullName="Stellar";
    else if(cryptoCurrency == "BNB")
      fullName="Binance";
    else if(cryptoCurrency == "WAVES")
      fullName="Waves";
    else if(cryptoCurrency == "CRV")
      fullName="CRV";
    else if(cryptoCurrency == "XRP")
      fullName="Xrp";
    else if(cryptoCurrency == "TRX")
      fullName="TRON";

    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff99ff66),Color(0xff1DB954),]),
          borderRadius: BorderRadiusDirectional.circular(16.0),
        ),
        child: Card(

          color: Color(0xFF191414),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),

            child: Column(
              children: <Widget>[
                Text(
                  '1 $fullName = $value $selectedCurrency',

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Date : $date',style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.yellow,
                    ),),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Time : $time',style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.yellow,
                    ),),
                  ],
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
