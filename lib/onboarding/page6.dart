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
              children: <Widget>[
                SizedBox(
                  child: Image(
                    image: AssetImage(Assets.pose3),
                    fit: BoxFit.fitHeight,
                  ),
                  height: 100.0,
                  width: 150.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Saisissez le montant et générez un Code à partir duquel votre client paiera.',
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