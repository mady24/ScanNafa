import 'package:dashboard/onboarding/assets.dart';
//import 'package:dashboard/onboarding/circle_image.dart';
import 'package:flutter/material.dart';

const double IMAGE_SIZE = 300.0;

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          /*new Positioned(
            child: new CircleWithImage(Assets.pose3),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),*/
          new Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                child: Text("Qr CODE", style: TextStyle(fontFamily: 'Dosis', fontSize: 30.0)),
                ),
                SizedBox(
                  child: Image(
                    image: AssetImage("assets/order_confirmed_2.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                  child: Text("Saisissez un montant et générez un montant à partir duquel le client vous paiera",
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'Dosis'),
                    textAlign: TextAlign.center,
                  ),
                ),
                
              ],
            ),
          )
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}