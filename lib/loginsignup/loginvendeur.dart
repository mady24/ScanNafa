import 'package:flutter/material.dart';
import 'package:dashboard/loginsignup/login_signup_page.dart';
import 'package:dashboard/loginsignup/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/navigationvendeur/changevendeurbottomnav.dart';


class LoginVendeur extends StatefulWidget{
  LoginVendeur({this.auth});

  final BaseAuth auth;

  @override
  _LoginVendeur createState() => new _LoginVendeur();
}

enum AuthStatus{
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _LoginVendeur extends State<LoginVendeur>{
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  Future<bool> sharedPricePreference(String price) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("uid", price);
  return prefs.commit();
}

  @override
  void initState(){
    super.initState();
    widget.auth.getCurrentUser().then((user){
      setState((){
        if(user != null){
          _userId = user?.uid;
        }
        authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onLoggedIn(){
    widget.auth.getCurrentUser().then((user){
      setState((){
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
      sharedPricePreference(_userId);
    });
  }

  void _onSignedOut(){
    setState((){
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }
  Widget _buildWaitingScreen(){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    switch(authStatus){
      case AuthStatus.NOT_DETERMINED:
        return _buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if(_userId.length > 0 && _userId != null){
          return new ChangeVendeurBottomNav(
            title: "Ska'Nafa",
            userId: _userId,
            auth: widget.auth,
            onSignedOut: _onSignedOut,
          );
        }else return _buildWaitingScreen();
        break;
      default: return _buildWaitingScreen();
    }
  }
}