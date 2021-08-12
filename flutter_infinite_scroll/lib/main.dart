import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/src/routes.dart';
import 'package:flutter_infinite_scroll/src/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: getApplicationRoutes(),
      initialRoute: initialRoute,
      home: HomePage(),
    );
  }
}