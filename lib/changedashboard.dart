import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dashboard/font_awesome_flutter.dart';
import 'package:dashboard/loginsignup/authentication.dart';
import 'package:dashboard/custom_icons_icons.dart';


class ChangeDashboard extends StatefulWidget{

  ChangeDashboard({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _ChangeDashboard createState() => _ChangeDashboard();
}

class _ChangeDashboard extends State<ChangeDashboard>{

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

 

  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

Material myItems(IconData icon, String heading, int color, int color1, String page){
  return Material(
    color: Color(color),
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
    child: GestureDetector(
      onTap: () =>  onPressed(page),
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
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Color(color1),
                        size: 60.0
                      ),
                    ),
                  ),
                   Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Text(heading, 
                    style: TextStyle(
                      color: Color(color1),
                      fontFamily: 'Dosis',
                       fontSize: 15.0, 
                    ),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ),
  );
}

@override
Widget build(BuildContext context){
  return Scaffold(
    body: Column(
      children: <Widget>[
      SizedBox(height: 50.0,),
      Container(
       color: Colors.white,
        constraints: BoxConstraints(
          maxHeight: 220.0,
          minHeight: 150.0
      ),
      child: Column(
        children: <Widget>[
         
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              child:Image.asset("assets/logo.png", height: 40.0,alignment: Alignment.centerLeft,),
            )
          ),
          Expanded(
            flex: 2,
            child: Icon(Icons.menu),
          ),
        ],
            ),
            SizedBox(height: 20.0,),  
            Material(
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
            child: Container(
              height: 150.0,
              decoration: new BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/happy-intersection.png'),fit: BoxFit.fitHeight, alignment: Alignment.centerLeft,colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop)),
                  border: Border(bottom: BorderSide(color: Color(0xff323E40).withOpacity(0.5)),top: BorderSide(color: Color(0xff323E40).withOpacity(0.5))),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Solde disponible', style: TextStyle(color: Colors.black, fontFamily: 'Dosis', fontSize: 25.0),textAlign: TextAlign.center,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Fcfa', style: TextStyle(fontFamily: 'Dosis', fontSize: 25.0, color: Colors.black), textAlign: TextAlign.right,),
                      Text('57540.00', style: TextStyle(fontFamily: 'Euro', fontSize: 40.0, color: Colors.black, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),)
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Dernière transaction: ', style: TextStyle(fontFamily: 'Dosis', fontSize: 20.0, color: Colors.black), textAlign: TextAlign.right,),
                      Text('Orange Money', style: TextStyle(fontFamily: 'Dosis', fontSize: 20.0, color: Colors.black, fontStyle: FontStyle.normal),)
                    ],
                  ),
                ],
              ),
              )
            )
            )
        ],   
      ),
    ),
      Container(
        color: Colors.white,
        constraints: BoxConstraints(
          maxHeight: 360.0,
          minHeight: 150.0
      ),
          child:ListView(
            
              children: <Widget>[
                //SizedBox(height: (MediaQuery.of(context).size.height/100)*6,),
                Row(
                  children: <Widget>[
                    SizedBox(width: (MediaQuery.of(context).size.width/100)*6,),
                    Container(
                      width: (MediaQuery.of(context).size.width/100)*41,
                      height: (MediaQuery.of(context).size.height/100)*25,
                      child:  myItems(CustomIcons.happy_intersection, "Scanner un Qr Code", 0xfff2ab27, 0xff000000, '/scan'),
                    ),
                    SizedBox(width: (MediaQuery.of(context).size.width/100)*6,),
                    Container(
                      width: (MediaQuery.of(context).size.width/100)*41,
                      height: (MediaQuery.of(context).size.height/100)*25,
                      child:  myItems(CustomIcons.pay, "Paiement", 0xff323E40, 0xffffffff, '/bottomnavclient/1'),
                    ),
                    SizedBox(width: (MediaQuery.of(context).size.width/100)*6,),
                  ],
                ),
                SizedBox(height: (MediaQuery.of(context).size.height/100)*6,),
                Row(
                  children: <Widget>[
                    SizedBox(width: (MediaQuery.of(context).size.width/100)*6,),
                    Container(
                      width: (MediaQuery.of(context).size.width/100)*41,
                      height: (MediaQuery.of(context).size.height/100)*25,
                      child:  myItems(CustomIcons.qr_code, "Dernier Qr scan", 0xff323E40, 0xffffffff, '/lastScan'),
                    ),
                    SizedBox(width: (MediaQuery.of(context).size.width/100)*6,),
                    Container(
                      width: (MediaQuery.of(context).size.width/100)*41,
                      height: (MediaQuery.of(context).size.height/100)*25,
                      child:  myItems(CustomIcons.invoice, "Historique", 0xff323E40, 0xffffffff, '/bottomnavclient/2'),
                    ),
                    SizedBox(width: (MediaQuery.of(context).size.width/100)*6,),
                  ],
                ),
              ],
            
        
         
          
          
          
        
      ),
      ),
      ],
    ),
  );
}

}