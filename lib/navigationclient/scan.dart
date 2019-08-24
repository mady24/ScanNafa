import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:dashboard/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({Key key, this.shared});
  final Shared shared;
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";
  var scanned;

  save(cle, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //final scanned = 42;
    prefs.setString(cle, value);
    print('saved $cle $value');
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  Future storescan(code) async {
    scanned = await widget.shared.save('scannedqr', code);
  }

  @override
  initState() {
    super.initState();
    //scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text('Scanner un code', style: TextStyle(fontFamily: 'Dosis', color: Colors.black), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
        body: new Center(
      child: new SizedBox(
        height: 600.0,
        child: new QrCamera(
          
          onError: (context, error) => Text(
                error.toString(),
                style: TextStyle(color: Colors.red),
              ),
          qrCodeCallback: (code) {
            setState(() {
              scanned = code;
              save('scannedqr', scanned['price']);
              save('seller', scanned['seller']);

              onPressed("/bottomnavclient/1");
            });
          },
          child: new Container(),
        ),
      ),
    ));
  }

  /*Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        //this.barcode = barcode;
        save('scannedqr', barcode);
        
      onPressed("/bottomnavclient/1");
      }
        );
      
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }*/
}
