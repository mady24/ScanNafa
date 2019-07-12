import 'package:flutter/material.dart';
import 'package:dashboard/navigationclient/history.dart';
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
      return ChangeClientPaiement(back: false);
      break;
      case 2:
      return History("historique");
      break;
    }
  }
}