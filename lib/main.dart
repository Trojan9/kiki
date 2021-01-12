import 'package:flutter/material.dart';
import 'package:kiki/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kikimayana.com',
      initialRoute: "/",
      routes: {
        '/': (context) => Homepage(),
      },
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
  
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Homepage(),
    );
  }
}
