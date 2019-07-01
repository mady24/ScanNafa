import 'package:flutter/material.dart';

class Validatepaiement extends StatefulWidget{
  @override
  _Validatepaiement createState() => _Validatepaiement();
}

class _Validatepaiement extends State<Validatepaiement>{

  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
          shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
                      
                      child: Image.asset('assets/logo.png', height: 80.0, width: 80.0, ),
                    ),
                  ),
          ),
        Center(
              child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text("Confirmer votre paiement",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 25.0
                            ),
                            ),
                          ),
                        ),
          ),
          Center(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                      
                      child: Image.asset('assets/om.png', height: 80.0, width: 80.0, ),
                    ),
                  ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code secret',
                    prefixStyle: TextStyle(fontFamily: 'Dosis')
                  ),
                  style: TextStyle(fontFamily: 'Dosis'),
              ),
            ),
          ),
          Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 68, 114),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Confirmer', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Dosis')),
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