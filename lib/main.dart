import 'package:flutter/material.dart';
import 'package:ipproject/pages/home.dart';
import 'package:ipproject/pages/loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home()
    },
    debugShowCheckedModeBanner: false
));