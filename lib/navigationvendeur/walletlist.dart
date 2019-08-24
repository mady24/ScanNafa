import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WalletList extends StatefulWidget{
  @override
  _WalletList createState()=> new _WalletList();
}

class _WalletList extends State<WalletList>{

  onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }


Material myItems(String image, String name, String amount, int color){
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
    child: InkWell(
        onTap: ()  => onPressed("/detail"),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Material(
                    borderRadius: BorderRadius.circular(24.0),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        image,
                        height: 80.0,
                        width: 80.0, 
                      ),
                    ),
                  ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 3.0),
                        child: Text(name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Dosis',
                          fontSize: 20.0 
                          ),
                          textAlign: TextAlign.center,),
                        ),
                    ),
                    Center(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text(amount,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Dosis',
                        fontSize: 25.0
                      ),
                      textAlign: TextAlign.center,
                      ),
                      
                      ),
                          ),
                          Container(
                            child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Text("F CFA",
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Dosis',
                        fontSize: 15.0
                      ),
                      textAlign: TextAlign.center,
                      ),
                      
                      ),
                          )
                        ],
                      ),
                    ),
                  ],
              ),
            ),
          ],
        ),
      )
    ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffffffff),
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Text('Wallet',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Dosis',
                      fontSize: 18.0)),
            ),
            Expanded(
              flex: 2,
              child: Image.asset('assets/logo.png', height: 45.0),
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
          myItems("assets/om.png", "Le solde de votre compte est de", "45000", 0xffed622b),
          myItems("assets/emoney.png", "Le solde de votre compte est de", "810", 0xffed622b),
          myItems("assets/wari.png", "Le solde de votre compte est de", "54820", 0xffed622b),
          myItems("assets/tigo.png", "Le solde de votre compte est de", "810", 0xffed622b),
          myItems("assets/joni.png", "Le solde de votre compte est de", "810", 0xffed622b),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 160.0),
          StaggeredTile.extent(2, 160.0),
          StaggeredTile.extent(2, 160.0),
          StaggeredTile.extent(2, 160.0),
          StaggeredTile.extent(2, 160.0),
        ],
      ),
    );
  }

}