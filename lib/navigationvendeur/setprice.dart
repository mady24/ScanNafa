import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetPrice extends StatefulWidget{
  @override
  _SetPrice createState() => new _SetPrice();
}

Future<bool> sharedPricePreference(String price) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("price", price);
  return prefs.commit();
  }

  

class _SetPrice extends State<SetPrice>{
   final myController = TextEditingController();
   String toscan;
   SharedPreferences _prefs;
    static const String cle = "codetoscan";

  @override
  void dispose(){
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
        body: ListView(
         shrinkWrap: true,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: Text("Un de plus!!!",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dosis',
                  fontSize: 15.0,
                ),),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: Image.asset("assets/logo.png",
                height: 120.0,
                width: 120.0),
              ),
            ),
            Center(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Somme à payer',
                    labelStyle: TextStyle(fontFamily: 'Dosis')
                  ),
                  controller: myController
                  
              ),
            ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      child: FlatButton(
                          onPressed: () => {
                              savePrice()
                                                          },
                                                        padding: EdgeInsets.all(0.0),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Image.asset('assets/addpaiement.png'),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Text('générer un QR code', style: TextStyle(fontFamily: 'Dosis'),),
                                                            ),
                                                          ],
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
                                  sharedPricePreference(price).then((bool committed){
                                      onPressed("/generate");
                                  });
                                }

}