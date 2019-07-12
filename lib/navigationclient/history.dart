import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class History extends StatelessWidget {
  History(this.listType);
  final String listType;

Material myItems(String image, String date, String name, String ref, String time, String amount, int color){
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Material(
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
            ),
            Expanded(
              flex: 3,
              child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 3.0),
                        child: Text(date,
                        style: TextStyle(
                          color: Colors.black38,
                          fontFamily: 'Dosis',
                          fontSize: 15.0 
                          ),),
                        ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(name,
                      style: TextStyle(
                        color: Colors.black38,
                        fontFamily: 'Dosis',
                        fontSize: 20.0
                      ),
                      textAlign: TextAlign.center,
                      ),
                      
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Text(ref,
                      style: TextStyle(
                        color: Colors.black38,
                        fontFamily: 'Dosis',
                        fontSize: 8.0
                      )),
                      ),
                    )
                  ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
                      child: Text(time, 
                      style: TextStyle(
                        color: Colors.black38,
                        fontFamily: 'Dosis',
                        fontSize: 15.0 
                        ),),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
                      child: Text(amount, 
                      style: TextStyle(
                        color: Colors.black38,
                        fontFamily: 'Dosis',
                        fontSize: 18.0
                      )),
                    ),
                  )
                ],
                ),
            )
          ],
        ),
      )
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset('assets/logo.png', height: 45.0,alignment: Alignment.centerLeft,),
            ),
            Expanded(
              flex: 7,
              child: Text('Historique des paiement effectués', style: TextStyle(fontFamily: 'Dosis', color: Colors.black), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
     body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myItems("assets/om.png", "10/10/2018", "Diallo boutiquier", "RS°3540", "22H02", "810", 0xffed622b),
          myItems("assets/om.png", "10/10/2018", "Auchan", "RS°0020", "22H30", "4000", 0xffed622b),
          myItems("assets/emoney.png", "10/10/2018", "Total Castor", "RS°5215", "23H10", "30000", 0xffed622b),
          myItems("assets/om.png", "11/10/2018", "Diallo boutiquier", "RS°3540", "09H00", "250", 0xffed622b),
          myItems("assets/wari.png", "11/10/2018", "Bus DDD", "RS°6524", "09H30", "150", 0xffed622b),
          myItems("assets/emoney.png", "12/10/2018", "Diallo boutiquier", "RS°3540", "08H02", "2500", 0xffed622b),
          myItems("assets/emoney.png", "12/10/2018", "Wonderfood", "RS°15648", "23H58", "810", 0xffed622b),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),
    );
  }
}