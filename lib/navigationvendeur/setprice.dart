import 'package:dashboard/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetPrice extends StatefulWidget {
  @override
  _SetPrice createState() => new _SetPrice();
}

Future<bool> sharedPricePreference(String price) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("price", price);
  return prefs.commit();
}

class _SetPrice extends State<SetPrice> {
  final myController = TextEditingController();
  String toscan;
  SharedPreferences _prefs;
  static const String cle = "codetoscan";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
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
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  'Recevoir un paiement',
                  style:
                      TextStyle(fontFamily: 'Euro', color: Color(0xff000000)),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Text(
                "Un de plus!!!",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Euro',
                  fontSize: 15.0,
                ),
              ),
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
                    top: BorderSide(color: Color(0xff323E40).withOpacity(0.1))),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Fcfa',
                        style: TextStyle(
                            fontFamily: 'Euro',
                            fontSize: 25.0,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                          obscureText: false,
                          style: TextStyle(fontSize: 35.0, fontFamily: 'Euro'),
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: myController),
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
              child: FlatButton(
                onPressed: () => {savePrice()},
                padding: EdgeInsets.all(0.0),
                child: Container(
                  height: 200.0,
                  child: Row( 
                  children: <Widget>[
                    Expanded(flex: 2, child: SizedBox(),),
                    Expanded(
                      flex: 10,
                      child:Material(
                  color: Color(0xfff2ab27),
                  elevation: 10.0,
                  shadowColor: Colors.grey,
                  
                  borderRadius: BorderRadius.circular(24.0),
                  child: InkWell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Material(
                                    color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(
                                            CustomIcons.qr_code,
                                            size: 100.0,
                                            color: Color(0xff000000),
                                          ))),
                                  Container(
                                    width: 150.0,
                          child: Text("Generer un Qr code",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Euro',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300
                            ),
                            textAlign: TextAlign.center,
                            ),
                        ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
                    ),
                  
                Expanded(flex: 2, child: SizedBox(),),
                  ],
                ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  savePrice() {
    String price = myController.text;
    sharedPricePreference(price).then((bool committed) {
      onPressed("/generate");
    });
  }
}
