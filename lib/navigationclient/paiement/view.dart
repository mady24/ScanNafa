import 'package:flutter/material.dart';
import 'package:dashboard/shared.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPrice extends StatefulWidget {
  ViewPrice({Key key, this.shared});
  Shared shared;
  @override
  _ViewPrice createState() => _ViewPrice();
}

class _ViewPrice extends State<ViewPrice> {
  bool isNull;
  String price;
  var prix;
  TextEditingController _priceController;
  SharedPreferences _prefs;
  static const String key = "scannedqr";
  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  save(cle, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //final scanned = 42;
    prefs.setString(cle, value);
    print('saved $cle $value');
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

  Material myItems(String image, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 3.0,
      shadowColor: Color(color),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: () => {
          
          onPressed("/validate")},
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
                        image,
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  height: 150.0,
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
                                'Somme à payer',
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
                                child: isNull == false?Text(
                                  this.price,
                                  style: TextStyle(
                                      fontFamily: 'Dosis',
                                      fontSize: 40.0,
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.left,
                                ):TextFormField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Dosis',
                                    fontSize: 25.0),
                                    controller: _priceController,
                              ),)
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
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ))),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Choisir le mode de payement:",
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
            height: 250.0,
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: <Widget>[
                myItems("assets/om.png", "Orange Money", 0xffe65100),
                myItems("assets/emoney.png", "E-money", 0xffba68c8),
                myItems("assets/wari.png", "Wari", 0xff00c853),
                myItems("assets/tigo.png", "Tigo cash", 0xff1a237e),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 130.0),
                StaggeredTile.extent(1, 130.0),
                StaggeredTile.extent(1, 130.0),
                StaggeredTile.extent(1, 130.0),
                StaggeredTile.extent(1, 130.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
