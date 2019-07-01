import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

final _foldingCellkey = GlobalKey<SimpleFoldingCellState>();

class FoldingCellListViewDemo extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

        }),
        title: Text("Calendar"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){

          }),
        ],
      ),
      body: Container(
        color: Color(0xffdfd4f4),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: SimpleFoldingCell(
                key: _foldingCellkey,
                frontWidget: frontWidget(),
                innerTopWidget: innerTopWidget(),
                innerBottomWidget: innerBottomWidget(),

                cellSize: Size(MediaQuery.of(context).size.width, 175),
                padding: EdgeInsets.all(10.0),
                animationDuration: Duration(milliseconds: 300),
                onOpen: () => print('cell opened'),
                onClose: () => print('cell closed'),
              ),
              ),

               

          
          ],
        ),
      ),
    );
  }
}

Container innerTopWidget(){
  return Container(
    color: Color(0xfff6a53a4),
    alignment: Alignment.center,
    child: Container(
      child: Column(
        children: <Widget>[
          //heading
          Container(),

          //title
          Container(
            child: Row(children: <Widget>[
              Container(),//icon
              Container(
                child: new FlatButton(
                  child: Text('close'),
                onPressed: () => _foldingCellkey?.currentState?.toggleFold(),
                ),
              ), //text
            ],),
          ),

          //Duration
          Container(),


          //Rock
          Container(),

          //Priority
          Container(),

        ],
      ),
    ),
  );
}

Container innerBottomWidget(){
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        ),
        //Bottom
        Container(),
      ],
    ),
  );
}

Container frontWidget(){
  return Container(
    color: Color(0xffdfd4f4),
    alignment: Alignment.center,
    child: Row(children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xfff6a53a4),
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Today",
                            style: TextStyle(
                              color :Color(0xFFeBb6ea),
                              fontSize: 20.0
                            ),
                            ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("09:00 AM",
                            style: TextStyle(
                              color :Color(0xFFeBb6ea),
                              fontSize: 20.0
                            ),
                            ),
                    ),
                  ),
                ]
              )
            ],)
          ),
        ),
      ),

      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Functionnal and Businness Units Metting",
                    style: TextStyle(
                     color: Color(0xff6a53e4),
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.mapMarkedAlt,
                          color: new Color(0xffF7a928),
                          size: 20.0,
                        ),
                      ),
                    ),
              
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new FlatButton(
                        child: Text("HeadOffice New York",
                          style: TextStyle(
                            color :Color(0xffed1bf7),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                
                      ),
                onPressed: () => _foldingCellkey?.currentState?.toggleFold(),
                      ),
                      ),
              
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    ),
    ],
    ),
  );
}

