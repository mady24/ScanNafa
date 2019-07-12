import 'package:dashboard/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/font_awesome_flutter.dart';
import 'package:dashboard/navigationvendeur/wallet.dart';
import 'package:dashboard/navigationvendeur/getpaiement.dart';
import 'package:dashboard/navigationvendeur/history.dart';
import 'package:dashboard/loginsignup/authentication.dart';


class ChangeVendeurBottomNav extends StatefulWidget{
  ChangeVendeurBottomNav({Key key, this.title, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  final String title;
 @override
 State<StatefulWidget> createState() {
    return _ChangeVendeurBottomNav();
  }
}

class _ChangeVendeurBottomNav extends State<ChangeVendeurBottomNav>{
  PageController _pageController;
  int _page = 0;
  String _title = 'Wallet';

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

  @override
  void initState(){
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page){
    _pageController.animateToPage(
      page,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease
    );
  }

  void onPageChanged(int page){
    setState(() {
      this._page = page;
      if(page == 0)
      _title = 'Wallet';
     if(page == 1)
      _title = 'Recevoir un paiement';
     if(page == 2)
      _title = 'Historique';
    });
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: new PageView(
        children: [
          new Wallet(),
          new GetPaiement(),
          new History()
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
            icon: new Icon(CustomIcons.wallet),
            title: new Text('Accueil', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.pay),
            title: new Text('Paiement', style: TextStyle(fontFamily: 'Dosis'),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.invoice),
            title: new Text('scanner', style: TextStyle(fontFamily: 'Dosis'),),
          ),
        ],
      ),
    );
  }

}