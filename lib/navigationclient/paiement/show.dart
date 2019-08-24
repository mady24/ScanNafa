import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Show extends StatefulWidget{

  @override
  _Show createState() => _Show();
}

class _Show extends State<Show>{

  var price;
  SharedPreferences _prefs;

 onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void _loadprice() {
    setState(() {
      this.price = this._prefs.getString('scannedqr') ?? '0';
    });
  }

   @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        _loadprice();
      });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/logo.png',
                height: 45.0,
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text('Effectuer un paiement',
                  style: TextStyle(fontFamily: 'Dosis', color: Colors.black)),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Material(
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
              child: Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/happy-intersection.png'),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerLeft,
                        colorFilter: new ColorFilter.mode(
                            Colors.white.withOpacity(0.1), BlendMode.dstATop)),
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xff323E40).withOpacity(0.5)),
                        top: BorderSide(
                            color: Color(0xff323E40).withOpacity(0.1))),
                  ),
                  child: Center(
                    
                    child: Text(
                                '''Code Scanné avec Succès''',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Dosis',
                                    fontSize: 40.0),
                                textAlign: TextAlign.center,
                              ),
                  ),
                  ),
                  ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/12,
                      child: Center(
                        
                        child: Text(
                          "La somme à payer est:",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/3,
          child:Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Text(
                                'Fcfa',
                                style: TextStyle(
                                    fontFamily: 'Dosis',
                                    fontSize: 25.0,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                                flex: 7,
                                child: Text(
                                  this.price,
                                  style: TextStyle(
                                      fontFamily: 'Dosis',
                                      fontSize: 40.0,
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.left,
                                ),)
                          ],
                        ),
          ),
                         Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5.0),
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xfff2ab27),
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: new Material(
                  child: MaterialButton(
                    child: Text('Suivant',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Dosis')),
                    onPressed: () => onPressed('/view'),
                    highlightColor: Colors.orange.withOpacity(0.5),
                    splashColor: Colors.orange.withOpacity(0.5),
                  ),
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}