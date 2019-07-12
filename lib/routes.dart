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
import 'package:dashboard/navigationclient/lastscan.dart';
import 'package:dashboard/navigationclient/scan.dart';




class Routes{
  
  var routes = <String, WidgetBuilder>{
    "/slider/client": (BuildContext context) => new WalkthroughScreen(client: 'client'),
    "/slider/vendeur": (BuildContext context) => new WalkthroughScreen(client: 'vendeur'),
    "/login": (BuildContext context) => new Login(auth: new Auth()),
    "/loginvendeur": (BuildContext context) => new LoginVendeur(auth: new Auth()),
    "/dashboardclient": (BuildContext context) => ChangeDashboard(),
    "/bottomnavclient/0": (BuildContext context) => ChangeClientBottomNav(pagetarget: 0),
    "/bottomnavclient/1": (BuildContext context) => ChangeClientBottomNav(pagetarget: 1),
    "/bottomnavclient/2": (BuildContext context) => ChangeClientBottomNav(pagetarget: 2),
    "/scan": (BuildContext context) => ScanScreen(),
    "/lastScan": (BuildContext context) => Lastscan(),
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