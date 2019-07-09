import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/custom_icons_icons.dart';

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
          image: new DecorationImage(image: new AssetImage('assets/happy-intersection.png'), fit: BoxFit.contain, colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop))
        ),
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:  30.0),
                    child: Text('Bienvenue sur Ska\'Nafa',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.w100,
                    ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
            Expanded(
              flex: 11,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 20.0),
              child: Text("Payer en toute simplicité et rapidement",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.w400,
                color: Colors.black
              ),
              textAlign: TextAlign.center,),
              ),
            ),
            Expanded(flex: 1,
                child: Container(
                  height: 200.0,
                  width: 5.0,
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 50, 62, 64),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomLeft: Radius.circular(25.0))
                  ),
                ),
            )
                  ],
                ),
            Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 10.0 , 5.0, 5.0),
                        child: Container(
                        width: 300.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 171, 39),
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Je suis Client',
                              style: TextStyle(fontFamily: 'Dosis', fontSize: 25.0,color: Color.fromARGB(255, 50, 62, 64)),
                            ),
                            onPressed: () => onPressed("/slider/client"),
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                        width: 300.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black38, width: 1.0),
                          color: Color.fromARGB(255, 50, 62, 64),
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Je suis Vendeur',
                              style: TextStyle(fontFamily: 'Dosis',fontSize: 25.0,color: Colors.white),
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
                      Container(
                        width: 300.0,
                        child:Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Row(
                          
                          children: <Widget>[
                            Text("En continuant, vous acceptez les ",style: TextStyle(fontFamily: 'Dosis', fontSize: 14.0, color: Color.fromARGB(255, 50, 62, 64))),
                            FlatButton(
                              onPressed: ()=>{},
                              padding: const EdgeInsets.all(0.0),
                              child: Text("termes d'utilisations", style: TextStyle(fontFamily: 'Dosis', fontSize: 14.0, color: Color.fromARGB(255, 50, 62, 64),decoration: TextDecoration.underline)),
                            )
                          ],
                        ),
                         Text("de l'application ",style: TextStyle(fontFamily: 'Dosis', fontSize: 14.0, color: Color.fromARGB(255, 50, 62, 64))),
                          ],
                      )
                      )
                      )
                    ],
                  ),
          ],
        ),
        ),
    );
  }
}