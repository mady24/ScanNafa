import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ChoosePayway extends StatefulWidget{
  @override
  _ChoosePayway createState() => _ChoosePayway();
}

class _ChoosePayway extends State<ChoosePayway>{

  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

    Material myItems(String image, String heading, int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: ()  => onPressed("/validate"),
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
                    child:Padding(
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
      )
    ),
  ),
  );
}


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Nous avons toujours le choix!!!",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 20.0
                            ),
                            ),
                          ),
                        ),
          ),
          Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      
                      child: Image.asset('assets/logo.png', height: 80.0, width: 80.0, ),
                    ),
                  ),
                ],
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
                            child: Text("Choisir le mode de payement:",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dosis',
                              fontSize: 25.0
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
            height: 200.0,
          child: StaggeredGridView.count(
             crossAxisCount: 2,
             crossAxisSpacing: 6.0,
             mainAxisSpacing: 6.0,
             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myItems("assets/om.png", "Orange Money", 0xffe65100),
          myItems("assets/joni.png", "Joni Joni", 0xfffdd835),
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