import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dashboard/font_awesome_flutter.dart';
import 'package:dashboard/loginsignup/authentication.dart';


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

Material myItems(IconData icon, String heading, int color, int page){
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
    child: GestureDetector(
      onTap: () =>  onPressed("/bottomnavclient/$page"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
                  Material(
                    color:  Colors.transparent,
                    borderRadius: BorderRadius.circular(24.0),
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Color.fromARGB(255, 242, 68, 114),
                        size: 60.0
                      ),
                    ),
                  ),
                   Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading, 
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dosis',
                       fontSize: 20.0,
                    ),
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
      Container(
       color: Colors.white,
        constraints: BoxConstraints(
          maxHeight: 200.0,
          minHeight: 150.0
      ),
      child: Column(
        children: <Widget>[
         
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Color.fromARGB(255, 242, 68, 114), fontFamily: 'Dosis')),
                onPressed: _signOut),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Mady Maodo Dieye",
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: 'Dosis',
                              fontSize: 12.0
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
                      
                      child: Image.asset('assets/logo.png', height: 80.0, width: 80.0, ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
            ),  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical:  30.0),
                    child: Text('Bienvenue sur',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30.0,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.normal,
                    ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical:  30.0),
                    child: Text(' Change',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ],
            ),
        ],   
      ),
    ),
      Container(
        color: Colors.white,
        constraints: BoxConstraints(
          maxHeight: 360.0,
          minHeight: 150.0
      ),
        child: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing:12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myItems(Icons.settings_overscan, "Scanner", 0xffed622b, 2),
          myItems(FontAwesomeIcons.chartLine, "Paiement", 0xff26eb3c, 1),
          myItems(FontAwesomeIcons.qrcode, "Dernier scan", 0xffff3266, 3),
          myItems(Icons.history, "Historique", 0xff3399fe, 4),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
        ],
      ),
      ),
      ],
    ),
  );
}

}