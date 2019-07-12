import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Validatepaiement extends StatefulWidget {
  @override
  _Validatepaiement createState() => _Validatepaiement();
}

class _Validatepaiement extends State<Validatepaiement> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff000000),
          ),
          onPressed: () => Navigator.of(context).pushNamed("/view"),
        ),
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Text('Confirmez le paiement',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dosis',
                      fontSize: 18.0)),
            ),
            Expanded(
              flex: 2,
              child: Image.asset('assets/logo.png', height: 45.0),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Material(
            elevation: 14.0,
            shadowColor: Color(0x802196F3),
            child: Container(
              height: 150.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/happy-intersection.png'),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                    colorFilter: new ColorFilter.mode(
                        Colors.white.withOpacity(0.1), BlendMode.dstATop)),
                border: Border(
                    bottom:
                        BorderSide(color: Color(0xff323E40).withOpacity(0.5)),
                    top: BorderSide(color: Color(0xff323E40).withOpacity(0.1))),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              height: 1.0,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              'Solde disponible',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Dosis',
                                  fontSize: 25.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              height: 1.0,
                            ),
                          ),
                          Expanded(
                              flex: 7,
                              child: Text(
                                'Code Scanné avec succès',
                                style: TextStyle(
                                    fontFamily: 'Dosis',
                                    fontSize: 10.0,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal),
                              )),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 130.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: 3,
                    child: Material(
                      color: Colors.white,
                      elevation: 3.0,
                      shadowColor: Colors.orange,
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
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        "assets/om.png",
                                        height: 80.0,
                                        width: 80.0,
                                      ),
                                    ),
                                  ),
                                  /*Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading, 
                    style: TextStyle(
                      color: new Color(color),
                       fontSize: 10.0,
                    ),
                    ),
                  ),
                ),*/
                                ],
                              )
                            ],
                          ),
                        )),
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Veuillez saisir votre code secret",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Dosis', fontSize: 20.0),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                child: Material(
                  elevation: 10.0,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Code secret',
                        prefixStyle: TextStyle(fontFamily: 'Dosis')),
                    style: TextStyle(fontFamily: 'Dosis'),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xfff2ab27),
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: new Material(
                  child: MaterialButton(
                    child: Text('Confirmer',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Dosis')),
                    onPressed: () => onPressed('/done'),
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
