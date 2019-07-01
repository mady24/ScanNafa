import 'package:flutter/material.dart';
import 'package:dashboard/navigationclient/history.dart';
import 'package:dashboard/navigationclient/lastscan.dart';
import 'package:dashboard/navigationclient/scan.dart';
import 'package:dashboard/navigationclient/changeclientpaiement.dart';



class List extends StatefulWidget{
  List({Key key, this.page,});
  final int page;

  @override
  _List createState() => _List();
}

class _List extends State<List>{
  int _page;

  @override
  void initState(){
    _page = widget.page;
  }

  @override
  Widget build(BuildContext context){
    switch(_page){
      case 1:
      return ChangeClientPaiement();
      break;
      case 2:
      return ScanScreen();
      break;
      case 3:
      return Lastscan();
      break;
      case 4:
      return History("historique");
      break;
    }
  }
}