import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GenerateCode extends StatefulWidget{
  @override
  _GenerateCode createState() => new _GenerateCode();
}

Future<String> getpricePrefrence() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String price = prefs.getString("price");
  return price;
}

class _GenerateCode extends State<GenerateCode>{
  String _price = "";
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
              body: ListView(
             shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Text("Un de plus!!!",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dosis',
                      fontSize: 15.0,
                    ),),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Image.asset("assets/logo.png",
                    height: 120.0,
                    width: 120.0),
                  ),
                ),
                Center(
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                  child: QrImage(
                    data: "$_price",
                    size: 200.0,
                  )
                ),
                      ),
                      Center(
                        child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 68, 114),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Scanner', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Dosis')),
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