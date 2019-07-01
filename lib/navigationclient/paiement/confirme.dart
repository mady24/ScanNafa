import 'package:flutter/material.dart';

class ConfirmePayWay extends StatefulWidget{
  @override
  _ConfirmePayWay createState() => _ConfirmePayWay();
}

class _ConfirmePayWay extends State<ConfirmePayWay>{

  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
                      
                      child: Image.asset('assets/logo.png', height: 120.0, width: 120.0, ),
                    ),
                  ),
          ),
          Container(
              child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Confirmer votre paiement",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0
                            ),
                            ),
                          ),
                        ),
          ),
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      
                      child: Image.asset('assets/om.png', height: 120.0, width: 120.0, ),
                    ),
                  ),
          ),
          Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              Colors.orange[600],
                              Colors.orange[900],
                            ],
                            begin: Alignment(0.5, -1.0),
                            end: Alignment(0.5, 1.0)
                          ),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Text('suivant', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                            onPressed: () => onPressed('/validate'),
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