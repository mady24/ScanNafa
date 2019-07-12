import 'package:dashboard/changedashboard.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/navigationclient/paiement/view.dart';
import 'package:dashboard/navigationclient/paiement/choose.dart';
import 'package:dashboard/navigationclient/paiement/confirme.dart';
import 'package:dashboard/navigationclient/paiement/validate.dart';
import 'package:dashboard/navigationclient/paiement/done.dart';

class ChangeClientPaiement extends StatefulWidget{
  ChangeClientPaiement({Key key, this.back}): super(key: key);
  bool back;
  @override
  State<StatefulWidget> createState(){
    return _ChangeClientPaiement();
  }
}

class _ChangeClientPaiement extends State<ChangeClientPaiement>{
  Map<String, dynamic> _data;

  @override
  void initState(){
    super.initState();
     widget.back == true ?? Navigator.of(context).pop();
  }
 
  
  var routes = <String, WidgetBuilder>{
   
    "/view": (BuildContext context) => new ViewPrice(),
    "/choose": (BuildContext context) => ChoosePayway(),
    "/confirme": (BuildContext context) => ConfirmePayWay(),
    "/validate": (BuildContext context) => Validatepaiement(),
    "/done": (BuildContext context) => Done(),
    "/dashboardclient": (BuildContext context) => new ChangeClientPaiement(back: true), 
  };

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: ViewPrice(),
     routes: routes,
   );
  }
}