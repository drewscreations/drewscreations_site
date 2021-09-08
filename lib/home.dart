import 'package:drewsreations_site/about_me.dart';
import 'package:drewsreations_site/information.dart';
import 'package:drewsreations_site/jobs.dart';
import 'package:drewsreations_site/projects.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Route _routeBuilder(Widget page) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("Drew Olson"),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: [],
        ),
        body: Center(
            child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_routeBuilder(Projects()));
            },
            child: Text('Projects'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_routeBuilder(Jobs()));
            },
            child: Text('Work Experience'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_routeBuilder(AboutMe()));
            },
            child: Text('About Me'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_routeBuilder(Information()));
            },
            child: Text('More Information'),
          ),
        ])));
  }
}
