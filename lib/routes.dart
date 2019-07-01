import 'package:dashboard/loginsignup/authentication.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/changedashboard.dart';
import 'package:dashboard/navigationclient/changeclientbottomnav.dart';
import 'package:dashboard/navigationvendeur/changevendeurbottomnav.dart';
import 'package:dashboard/onboarding/walktrough.dart';
import 'package:dashboard/landingpage.dart';
import 'package:dashboard/loginsignup/login.dart';
import 'package:dashboard/loginsignup/loginvendeur.dart';
import 'package:dashboard/shared.dart';




class Routes{
  
  var routes = <String, WidgetBuilder>{
    "/slider/client": (BuildContext context) => new WalkthroughScreen(client: 'client'),
    "/slider/vendeur": (BuildContext context) => new WalkthroughScreen(client: 'vendeur'),
    "/login": (BuildContext context) => new Login(auth: new Auth()),
    "/loginvendeur": (BuildContext context) => new LoginVendeur(auth: new Auth()),
    "/dashboardclient": (BuildContext context) => ChangeDashboard(),
    "/bottomnavclient/1": (BuildContext context) => ChangeClientBottomNav(pagetarget: 1),
    "/bottomnavclient/2": (BuildContext context) => ChangeClientBottomNav(pagetarget: 2),
    "/bottomnavclient/3": (BuildContext context) => ChangeClientBottomNav(pagetarget: 3),
    "/bottomnavclient/4": (BuildContext context) => ChangeClientBottomNav(pagetarget: 4),
    "/vendeur": (BuildContext context) => new ChangeVendeurBottomNav(),
  };

  Routes(){
    runApp(new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:  Colors.grey[200],
      ),
      home: new LandingPage(),
      routes: routes, 
    ));
  }
}