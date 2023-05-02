import 'package:flutter/material.dart';
import 'package:time_app/Pages/choose_location.dart';
import 'package:time_app/Pages/home.dart';
import 'Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => loading(),
      '/home':(context) => home(),
      '/location':(context) => chooseLocation()
    },
  ));
}

