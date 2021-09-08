import 'package:flutter/material.dart';

class Information extends StatelessWidget {
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
        body: Container(
          child: ListView(
            children: [
              Card(
                child: Text(
                    "Website made with flutter. Deployed with google firebase."),
              )
            ],
          ),
        ));
  }
}
