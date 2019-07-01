import 'package:flutter/material.dart';
import 'walletlist.dart';
import 'walletdetail.dart';

class Wallet extends StatefulWidget{
  @override
  _Wallet createState()=> new _Wallet();
}

class _Wallet extends State<Wallet>{
  var route = <String, WidgetBuilder>{
   
    "/list": (BuildContext context) => new WalletList(),
    "/detail": (BuildContext context) => new WalletDetail()
  };

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: WalletList(),
     routes: route,
   );
  }
}