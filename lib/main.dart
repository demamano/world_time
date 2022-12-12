import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Loading.dart';
import 'package:flutter_application_1/pages/Location.dart';
import 'package:flutter_application_1/pages/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/location',
      routes: {
        // '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location()
      },
    ));
