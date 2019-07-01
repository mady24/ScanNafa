import 'package:flutter/material.dart';

class Scanned with ChangeNotifier {
  String _scanned;

  Scanned(this._scanned);

  getCounter() => _scanned;
  setCounter(String scanned) => _scanned = scanned;

}