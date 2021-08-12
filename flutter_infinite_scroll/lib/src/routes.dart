import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/src/views/home_page.dart';

String initialRoute = 'home';

Map<String,WidgetBuilder> getApplicationRoutes() {
  
  return <String, WidgetBuilder> {
        'home' :(BuildContext context)=> HomePage(),
        
  };
}