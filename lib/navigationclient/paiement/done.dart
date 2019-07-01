import 'package:flutter/material.dart';

class Done extends StatefulWidget{
  @override
  _Done createState() => _Done();
}

class _Done extends State<Done>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
                      
                      child: Image.asset('assets/logo.png', height: 120.0, width: 120.0, ),
                    ),
                  ),
          ),
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      
                      child: Image.asset('assets/checked.png', height: 60.0, width: 60.0, ),
                    ),
                  ),
          ),
          Container(
              child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                            child: Text("Le paiement a été effectué avec Succès!!!!",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 35.0,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                        ),
          ),
        ],
      ),
    );
  }
}