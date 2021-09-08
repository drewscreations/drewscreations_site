import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
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
                    "Passion for researching and developing new technologies. Works well with ambiguous project definitions from concept to completion. Experience with finding trends and creating distinct models from complicated data. Bachelor of Science in Physics, along with management experience as Nuclear Electronics Technician from the U.S. Navy. "),
              )
            ],
          ),
        ));
  }
}
