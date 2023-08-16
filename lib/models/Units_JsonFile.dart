/*
 *Technical Programming III Assignment
 * S Nkosi
 * The Json File
 */

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TheJsonFile with ChangeNotifier {
  //The Variables
  Map<String, dynamic> _map = {};
  int _pointnumber = 0;
  bool _error = false;
  String _erroMessage = '';

  //The Get Variables
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  int get pointnumber => _pointnumber;
  String get erroMessage => _erroMessage;

  //The Set Variable
  set pointnumber(int select) {
    _pointnumber = select;
    notifyListeners();
  }

  //The Future
  Future<void> get fetchData async {
    final respond = await get(Uri.parse(
        'https://dl.dropbox.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'));

    if (respond.statusCode == 200) {
      try {
        _map = jsonDecode(respond.body);
        _error = false;
      } catch (e) {
        _error = true;
        _erroMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _erroMessage = "Error: It could be your internet connection";
      _map = {};
    }

    notifyListeners();
  }

    //The InitialState
    void initialState(){
    _map = {};
    _error = false;
    _erroMessage ='';
    notifyListeners();
  }
}
