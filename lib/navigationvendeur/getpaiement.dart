import 'package:flutter/material.dart';
import 'package:dashboard/navigationvendeur/setprice.dart';
import 'package:dashboard/navigationvendeur/generatecode.dart';
import 'package:dashboard/navigationclient/paiement/done.dart';

class GetPaiement extends StatefulWidget{
  @override
  _GetPaiement createState()=> new _GetPaiement();
}

class _GetPaiement extends State<GetPaiement>{
  var route = <String, WidgetBuilder>{
   
    "/set": (BuildContext context) => new SetPrice(),
    "/generate": (BuildContext context) => new GenerateCode(),
    "/done": (BuildContext context) => new Done(),
  };

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SetPrice(),
     routes: route,
   );
  }
}