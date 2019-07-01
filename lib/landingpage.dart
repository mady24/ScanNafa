import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget{
  @override
  _LandingPage createState() => new _LandingPage();
}

class _LandingPage extends State<LandingPage>{
   onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: new Container(
        decoration: new BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
              Color.fromRGBO(242, 199, 72, 1),
              Color.fromRGBO(242, 218, 145, 1),
              Color.fromRGBO(242, 199, 72, 1),
            ],
            stops:[
                  0.3,
                  0.3,
                  0.3
            ],
            tileMode: TileMode.clamp,
          )
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child:  Image.asset("assets/logo1.png"),
            ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical:  5.0),
                    child: Text('Bienvenue sur',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dosis',
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                    ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical:  0.0),
                    child: Text(' Mkoba',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Text("Payer en toute simplicité et rapidement",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              textAlign: TextAlign.center,),
            ),
            Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 25.0 , 5.0, 5.0),
                        child: Container(
                        width: 220.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 68, 114),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Je suis Client',
                              style: TextStyle(fontFamily: 'Dosis',color: Colors.white),
                            ),
                            onPressed: () => onPressed("/slider/client"),
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                        width: 220.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.black38, width: 1.0),
                          color: Colors.white,
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Je suis Vendeur',
                              style: TextStyle(fontFamily: 'Dosis',color: Colors.black),
                            ),
                            onPressed: () => onPressed("/slider/vendeur"),
                            highlightColor: Colors.black38,
                            splashColor: Colors.black38,
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      ),
                    ],
                  ),
          ],
        ),
        ),
    );
  }
}