import 'package:flutter/material.dart';
import 'package:dashboard/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';




class ViewPrice extends StatefulWidget{
  ViewPrice({Key key, this.shared});
  Shared shared;
  @override
  _ViewPrice createState() => _ViewPrice();
}

class _ViewPrice extends State<ViewPrice>{
  String price;
  SharedPreferences _prefs;
  static const String key = "scannedqr";
  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

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
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      
                      child: Image.asset('assets/logo.png', height: 120.0, width: 120.0, ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Code Scanne avec success",
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: 'Dosis',
                              fontSize: 15.0
                            ),
                            ),
                          ),
                        ),
          ),
          Container(
            child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            child: Divider(
                              color: Colors.grey[400],
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
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Somme a payer:",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 40.0
                            ),
                            ),
                          ),
                        ),
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                   padding: const EdgeInsets.all(2.0),
                                   child: Text('${this.price}',
                                    style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Dosis',
                                    fontSize: 40.0
                                    ),
                                  ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                   padding: const EdgeInsets.all(2.0),
                                   child: Text("F cfa",
                                    style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Dosis',
                                    fontSize: 20.0
                                    ),
                                  ),
                                  ),
                                ),
                              ],
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
          ),
          Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 68, 114),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Text('suivant', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Dosis')),
                            onPressed: () => onPressed('/choose'),
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