import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Done extends StatefulWidget{
  @override
  _Done createState() => _Done();
}

class _Done extends State<Done>{
  var price;
  SharedPreferences _prefs;

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
      appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset('assets/logo.png', height: 45.0,alignment: Alignment.centerLeft,),
            ),
            Expanded(
              flex: 7,
              child: Text('Paiement effectué', style: TextStyle(fontFamily: 'Dosis', color: Colors.black), textAlign: TextAlign.center,),
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
                  image: DecorationImage(image: AssetImage('assets/happy-intersection.png'),fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop)),
                  border: Border(bottom: BorderSide(color: Color(0xff323E40).withOpacity(0.5)),top: BorderSide(color: Color(0xff323E40).withOpacity(0.1))),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                       Expanded(
                        flex: 5,
                        child: SizedBox(height: 1.0,),
                      ),
                      Expanded(
                        flex: 7,
                        child:Text('Nouveau Solde', style: TextStyle(color: Colors.black, fontFamily: 'Dosis', fontSize: 25.0),textAlign: TextAlign.left,),
                      ),
                      ],
                  ),
                  Row(
                      children: <Widget>[
                       Expanded(
                        flex: 5,
                        child: Text('Fcfa', style: TextStyle(fontFamily: 'Dosis', fontSize: 25.0, color: Colors.black), textAlign: TextAlign.center,),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text('575540.00', style: TextStyle(fontFamily: 'Dosis', fontSize: 40.0, color: Colors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),textAlign: TextAlign.left,)
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: SizedBox(height: 1.0,),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Dernière transaction: ', style: TextStyle(fontFamily: 'Dosis', fontSize: 10.0, color: Colors.black), textAlign: TextAlign.right,),
                      Text('Orange Money', style: TextStyle(fontFamily: 'Dosis', fontSize: 10.0, color: Colors.black, fontStyle: FontStyle.normal),)
                    ],
                  ),
                      ),
                    ],
                  ),
                ]
                ),
              ),
            ),
          ),
          Container(
            child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      
                      child: Image.asset('assets/success.png', height: 140.0, width: 140.0, ),
                    ),
                  ),
          ),
          Container(
              child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5.0),
                            child: Text("Paiement effectué avec succès",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w300
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                        ),
          ),
          Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
        child: Container(
                        width: 200.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xfff2ab27),
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                          
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Nouvelle transaction', style: new TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: 'Dosis')),
                            onPressed: () => onPressed('/set'),
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