import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lastscan extends StatefulWidget {
  @override
  _Lastscan createState() => _Lastscan();

}

class _Lastscan extends State<Lastscan>{
 String price;
  SharedPreferences _prefs;
  static const String key = "scannedqr";

  void _loadprice(){
        setState(() {
         this.price = this._prefs.getString('scannedqr') ?? '0';
        });
      }
      

  @override
  void initState(){
    super.initState();
    SharedPreferences.getInstance()
    ..then((prefs){
      setState(() => this._prefs = prefs);
      _loadprice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
         body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
                      
                      child: Image.asset('assets/logo.png', height: 60.0, width: 60.0, ),
                    ),
                  ),
          ),
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      
                      child: QrImage(
                data: "${this.price}",
                size: 200.0,
              )
                    ),
                  ),
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
                            child: Text("Somme",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 35.0,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                  Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
                            child: Text("${this.price}",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 35.0,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                  Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
                            child: Text("FCFA",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                          ],
                        ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
                          child: Row(
                            children: <Widget>[
                             Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                            child: Text("Vendeur:",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 25.0,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                            child: Text("Boutiquier Diallo",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 25.0,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                            ]
                          )
            )
                  ),
        ],
      ),
    );
  }
}