import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


final _controller = ScrollController();

final _firestore = Firestore.instance;
FirebaseApp firebase;


class DataScreen extends StatefulWidget {
  static const String id ="data_scr";
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final firestoreInstance = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  @override




  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    var data = "";
    if(arguments['name']=="Bitcoin")
    {
      data = " Bitcoin is a network that runs on a protocol known as the blockchain.A 2008 paper by a person or people calling themselves Satoshi Nakamoto first described both the blockchain and Bitcoin and for a while the two terms were all but synonymous.The blockchain​ has since evolved into a separate concept, and thousands of blockchains have been created using similar cryptographic techniques. This history can make the nomenclature confusing. Blockchain sometimes refers to the original, Bitcoin blockchain. Bitcoin miners run complex computer rigs to solve complicated puzzles in an effort to confirm groups of transactions called blocks; upon success, these blocks are added to the blockchain record and the miners are rewarded with a small number of bitcoins.Other participants in the Bitcoin market can buy or sell tokens through cryptocurrency exchanges or peer-to-peer.The Bitcoin ledger is protected against fraud via a trustless system; Bitcoin exchanges also work to defend themselves against potential theft, but high-profile thefts have occurred ";
    }
    else if(arguments['name']=="Ethereum")
    {
      data = "Launched in 2015, Ethereum is an open-source, blockchain-based, decentralized software platform used for its own cryptocurrency, ether. It enables SmartContracts and Distributed Applications (ĐApps) to be built and run without any downtime, fraud, control, or interference from a third party.Ethereum is not just a platform but also a programming language (Turing complete) running on a blockchain, helping developers to build and publish distributed applications.The applications run on Ethereum are run on a platform-specific cryptographic token, ether. During 2014, Ethereum had launched a pre-sale for ether which had received an overwhelming response. Ether is like a vehicle for moving around on the Ethereum platform and is mostly sought by developers looking to develop and run applications inside Ethereum. Ether is used broadly for two purposes: it is traded as a digital currency exchange like other cryptocurrencies, and it is used inside Ethereum to run applications and even to monetize work.According to Ethereum, it can be used to “codify, decentralize, secure, and trade just about anything.” One of the big projects around Ethereum is Microsoft’s partnership with ConsenSys which offers Ethereum Blockchain as a Service (EBaaS) on Microsoft Azure so Enterprise clients and developers can have a single click cloud-based blockchain developer environment .";
    }
    else if(arguments['name']=="Litecoin")
    {
      data = " Litecoin is the third-largest cryptocurrency after bitcoin and XRP. Litecoin, like its contemporaries, functions in one sense as an online payment system. Like PayPal or a bank’s online network, users can use it to transfer currency to one another. But instead of using U.S. dollars, Litecoin conducts transactions in units of Litecoin. Like all cryptocurrencies, Litecoin is not issued by a government, which historically has been the only entity that society trusts to issue money. Instead of being regulated by a central bank and coming off the press at the Bureau of Engraving and Printing, Litecoins are created by the elaborate procedure called mining, which consists of processing a list of Litecoin transactions. Unlike traditional currencies, the supply of Litecoins is fixed. he incentive for mining is that the first miner to successfully verify a block is rewarded with 12.5 Litecoins ";
    }
    else if(arguments['name']=="XLM")
    {
      data = " Lumen (XLM) is the native cryptocurrency for Stellar, an open source blockchain payment system. The purpose of Stellar is to connect financial institutions via the blockchain and provide cheap transactions in developing markets. Jed McCaleb, a longtime cryptocurrency entrepreneur who founded bitcoin exchange Mt. Gox and co-founded blockchain-based payment system Ripple Labs, created Stellar in July of 2014. Stellar uses a federated byzantine agreement (FBA) algorithm instead of a traditional mining network to validate transactions. Since the transfer of lumens doesn’t require approval from traditional cryptocurrency miners, the Stellar network enables quicker transactions than some other blockchain-based systems. The Stellar protocol is supported by a Delaware nonprofit corporation, the Stellar Development Foundation, though this organization does not enjoy 501(c)(3) tax-exempt status with the IRS ";
    }
    else if(arguments['name']=="BNB")
    {
      data = " Binance Coin (BNB) is a cryptocurrency that can be used to trade and pay fees on the Binance cryptocurrency exchange. The Binance Exchange is the largest cryptocurrency exchange in the world as of January 2018, facilitating more than 1.4 million transactions per second. Users of Binance Coin receive a discount in transaction fees on the Binance Exchange as an incentive. BNB can also be exchanged or traded for other cryptocurrencies, such as Bitcoin, Ethereum, Litecoin, etc. Binance Coin was created in July 2017 and initially worked on the ethereum blockchain with the token ERC-20 before it became the native currency of Binance’s own blockchain, the Binance Chain. ";
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,

        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF191414),
          title: Center(
              child: Text(
                "Krypto",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Lobster', fontSize: 25.0),
              )),

//            elevation: 50.0,

          bottom: PreferredSize(
              child: Container(
                color: Color(0xff1DB954),
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: Center(
            child: Container(
              decoration: BoxDecoration( color: Color(0xFF191414)),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(
//                          color: Color.fromRGBO(225, 95, 27, .3),
                        color:Color.fromRGBO(8, 19, 53, 50),
                        blurRadius: 10,
                        offset: Offset(0.0,0.75)
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ListView(
                  controller: _controller,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color(0xff1DB954),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              )),
                          child: Text(
                            "Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                         data,
                        //"Bitcoin[a] (₿) is a cryptocurrency invented in 2008 by an unknown person or group of people using the name Satoshi Nakamoto.[13] The currency began use in 2009[14] when its implementation was released as open-source software.[6]:ch. 1 Bitcoin is a decentralized digital currency, without a central bank or single administrator, that can be sent from user to user on the peer-to-peer bitcoin network without the need for intermediaries.[7] Transactions are verified by network nodes through cryptography and recorded in a public distributed ledger called a blockchain.",
                        style: TextStyle(

                          color: Colors.black,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                  ],
                ),
              ),
            )),

      ),
    );
  }



}

