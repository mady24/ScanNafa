import 'package:dashboard/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/font_awesome_flutter.dart';
import 'package:dashboard/loginsignup/authentication.dart';
import 'package:dashboard/navigationclient/list.dart';
import 'package:dashboard/shared.dart';




class ChangeClientBottomNav extends StatefulWidget{
  ChangeClientBottomNav({Key key, this.auth, this.userId, this.onSignedOut, this.pagetarget, this.scanned})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  String scanned;
  final int pagetarget;
 @override
 State<StatefulWidget> createState() {
    return _ChangeClientBottomNav();
  }
}

class _ChangeClientBottomNav extends State<ChangeClientBottomNav>{
  PageController _pageController;
  int _page;
  String _title;

  


onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }

  @override
  void initState(){
    super.initState();
    _pageController = new PageController();
    _page = widget.pagetarget;
    if(_page == 1){
       _title = "Faire un paiement";
    }
    if(_page == 2){
       _title = "Scanner";
    }
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page){
    page == 0 
    ? onPressed("/dashboardclient")
    :_pageController.animateToPage(
      page,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease
    );
  }

  void onPageChanged(int page){
    setState(() {
      this._page = page;
      if(page == 0)
      _title = 'Faire un paiement';
    if(page == 1)
      _title = 'Faire un paiement';
     if(page == 2)
      _title = 'Scanner';
    });
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: new PageView(
        children: [
          new List(page: _page),
          new List(page: _page),
          new List(page: _page),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xfff2ab27),
        onTap: navigationTapped,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.application__1_),
            title: new Text('Accueil', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.pay),
            title: new Text('Paiement', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.invoice),
            title: new Text('Historique', style: TextStyle(fontFamily: 'Dosis'),),
          )
        ],
      ),
    );
  }

}