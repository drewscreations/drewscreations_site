import 'package:drewsreations_site/home.dart';
import 'package:drewsreations_site/home_slivers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void onPressed() {}
  @override
  Widget build(BuildContext context) {
    IconButton portfolio =
        IconButton(onPressed: onPressed, icon: Icon(Icons.list_alt));
    return MaterialApp(
        title: 'Drewscreations',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
          primaryColor: Colors.deepPurple[300],
          accentColor: Colors.purpleAccent,
        ),
        home: HomeSlivers());
    //home: Home());
  }
}
