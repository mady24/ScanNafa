import 'package:flutter/material.dart';
import '../font_awesome_flutter.dart';


class WalletDetail extends StatefulWidget{
  @override
  _WalletDetail createState() => new _WalletDetail();
}

class _WalletDetail extends State<WalletDetail>{

  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/om.png",
                    height: 80.0,
                    width: 80.0,
                  ),
               ),
             ),
             Expanded(
               flex: 3,
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Text("Orange Money",
                 style: TextStyle(
                   color: Colors.black87,
                   fontFamily: 'Dosis',
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold,
                 ),),
               ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
                child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Divider(
                              color: Colors.black45,
                            ),
                          ),
             ),
             Expanded(
                  child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Icon(FontAwesomeIcons.moneyBillWave),
                          ),
             ),
             Expanded(
                  child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Divider(
                              color: Colors.black45,
                            ),
                          ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                 child: Text("solde Fedha:",
                 style: TextStyle(
                   color: Colors.black54,
                   fontFamily: 'Dosis',
                   fontSize: 15.0,
                 )),
               ),
             ),
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                  Text("45000",
                 style: TextStyle(
                   color: Colors.black54,
                   fontFamily: 'Dosis',
                   fontSize: 15.0,
                 ),),
                 Text("F CFA",
                 style: TextStyle(
                   color: Colors.black54,
                   fontSize: 10.0,
                   fontFamily: 'Dosis',
                   fontWeight: FontWeight.bold,
                 ),)
                   ],
                 ),
               ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                 child: Text("Solde Wallet:",
                 style: TextStyle(
                   color: Colors.black54,
                   fontFamily: 'Dosis',
                   fontSize: 15.0,
                 )),
               ),
             ),
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                  Text("45000",
                 style: TextStyle(
                   color: Colors.black54,
                   fontFamily: 'Dosis',
                   fontSize: 15.0,
                 ),),
                 Text("F CFA",
                 style: TextStyle(
                   color: Colors.black54,
                   fontFamily: 'Dosis',
                   fontSize: 10.0,
                   fontWeight: FontWeight.bold,
                 ),)
                   ],
                 ),
               ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
                child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Divider(
                              color: Colors.black45,
                            ),
                          ),
             ),
             Expanded(
                  child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Icon(FontAwesomeIcons.exchangeAlt),
                          ),
             ),
             Expanded(
                  child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Divider(
                              color: Colors.black45,
                            ),
                          ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.all(0.0),
                  child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                         color: Color.fromARGB(255, 242, 68, 114),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Text(
                          'Fedha ',
                          style: TextStyle(fontSize: 15.0, color: Colors.white, fontFamily: 'Dosis')
                        ),
                        Icon(FontAwesomeIcons.arrowAltCircleRight, size: 10.0, color: Colors.white),
                        Text(
                          ' F CFA',
                          style: TextStyle(fontSize: 15.0, color: Colors.white, fontFamily: 'Dosis',
                        )
                        )
                        ],
                      ),
                            onPressed: () => onPressed('/list'),
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        ),
                  
               ),
             ),
             Expanded(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.all(0.0),
                 child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                         color: Color.fromARGB(255, 242, 68, 114),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Text(
                          'F CFA ',
                          style: TextStyle(fontSize: 15.0, color: Colors.white, fontFamily: 'Dosis')
                        ),
                        Icon(FontAwesomeIcons.arrowAltCircleRight, size: 10.0, color: Colors.white),
                        Text(
                          ' Fedha',
                          style: TextStyle(fontSize: 15.0, color: Colors.white, fontFamily: 'Dosis'),
                        )
                        ],
                      ),
                            onPressed: () => onPressed('/list'),
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        ),
               ),
             )
           ],
         ),
       ],
     )
    );
  }

}