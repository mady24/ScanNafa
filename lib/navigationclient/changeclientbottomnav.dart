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
    if(_page == 3){
       _title = "Dernier code scanné";
    }
    if(_page == 4){
       _title = "Historique";
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
     if(page == 3)
      _title = 'Dernier code scanné';
     if(page == 2)
      _title = 'Scanner';
     if(page == 4)
      _title = 'Historique';
    });
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
         leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context),
        ),
        title: new Text(
          _title,
          style: TextStyle(fontFamily: 'Dosis'),
        ),
      ),
      body: new PageView(
        children: [
          new List(page: _page),
          new List(page: _page),
          new List(page: _page),
          new List(page: _page),
          new List(page: _page),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromARGB(255, 242, 68, 114),
        onTap: navigationTapped,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.home),
            title: new Text('Accueil', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.chartLine),
            title: new Text('Paiement', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.camera),
            title: new Text('scanner', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.qrcode),
            title: new Text('Dernier Scan', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.history),
            title: new Text('Historique', style: TextStyle(fontFamily: 'Dosis'),),
          )
        ],
      ),
    );
  }

}