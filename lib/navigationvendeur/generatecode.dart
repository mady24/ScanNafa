import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/loginsignup/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GenerateCode extends StatefulWidget{
  GenerateCode({Key key, this.auth, this.userId}) : super(key: key);
   final BaseAuth auth;
  final String userId;
  @override
  _GenerateCode createState() => new _GenerateCode();
}



Future<String> getpricePrefrence() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String price = prefs.getString("price");
  return price;
}

/*Future<String> getuidPrefrence() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String uid = prefs.getString("uid");
  return uid;
}*/

class _GenerateCode extends State<GenerateCode>{
  var id;
  String _price = "";
  SharedPreferences prefs;
  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }
  @override
  void initState(){
    getpricePrefrence().then(updatePrice);
    
        super.initState();
      }
    
      @override
        Widget build(BuildContext context){
            return new Scaffold(
              appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffffffff),
          automaticallyImplyLeading: false,
          /*leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context),
        ),*/
          title: new Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/logo.png',
                  height: 45.0,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  'Recevoir un paiement',
                  style:
                      TextStyle(fontFamily: 'Dosis', color: Color(0xff000000)),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
              body: ListView(
             shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Text("Montez à votre client",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dosis',
                      fontSize: 15.0,
                    ),),
                  ),
                ),
                 Material(
            elevation: 14.0,
            shadowColor: Color(0x802196F3),
            child: Container(
              height: 100.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/happy-intersection.png'),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerRight,
                    colorFilter: new ColorFilter.mode(
                        Colors.white.withOpacity(0.1), BlendMode.dstATop)),
                border: Border(
                    bottom:
                        BorderSide(color: Color(0xff323E40).withOpacity(0.5)),
                    top: BorderSide(color: Color(0xff323E40).withOpacity(0.5))),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Text(
                        'N°',
                        style: TextStyle(
                            fontFamily: 'Euro',
                            fontSize: 25.0,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text('4573',
                          
                          style: TextStyle(fontSize: 35.0, fontFamily: 'Euro'),
                          ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
            ),
          ),
                Center(
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
                  child: QrImage(
                    data: "{['price': $_price]}",
                    size: 200.0,
                  )
                ),
                      ),
                      Center(
                        child: Container(
                        width: 200.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xff323e40),
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Annuler', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Dosis')),
                            onPressed: () => onPressed('/done'),
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        ),
                      )
              ],
            ),
            );
        }
    
      void updatePrice(String price) {
        setState(() {
          this._price = price;
        });
  }
}