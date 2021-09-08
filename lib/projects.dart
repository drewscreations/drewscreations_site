import 'package:drewsreations_site/project.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List myProjects = [
  {
    "name": "V-Time",
    "description":
        "V-Time project is a platform developed by a two-developer team for Coding Dojo's project week hackathon. It allows users to volunteer for events posted by companies on the platform and tracks the volunteer hours contributed by the user.",
    "gitLink": "https://github.com/achou022/V-Time-Project",
    "languages": "Python",
    "apis": "Django, BCrypt, SQLite, JQuery, Plotly, Regex, HTML, CSS",
    "icon": 61269,
  },
  {
    "name": "Boat Racing",
    "description":
        "This is a game using the phaser game engine. It has multiple enemy boats driven by custom ai. There are several checkpoints that need to be completed in the appropriate order for the win condition.",
    "gitLink": "https://github.com/drewscreations/boat_race",
    "languages": "JavaScript",
    "apis": "Vue, Phaser, AWS, Elastic Beanstalk",
    "icon": 57811,
  },
  {
    "name": "Portfolio",
    "description": "This is the site you're looking at!",
    "gitLink": "",
    "languages": "Dart, JavaScript",
    "apis": "Firebase, Flutter",
    "icon": 61580,
  },
  {
    "name": "Neogotchi",
    "description":
        "This game has login using Auth0 and a backend database using MongoDB. The server and the client communicate in real time with the react game engine.",
    "gitLink": "https://github.com/drewscreations/neogotchi",
    "languages": "JavaScript",
    "apis": "React, Auth0, Matter-JS, Express,  Mongoose, MongoDB",
    "icon": 62469,
  },
  {
    "name": "MoShops",
    "description":
        "MoShops is an art portfolio site which allows firebase authenticated users to upload files to google cloud storage. The results are indexed to a firestore database and parsed to the React DOM.",
    "gitLink": "https://github.com/drewscreations/MoShops",
    "languages": "JavaScript, TypeScript",
    "apis": "Ionic, Capacitor, Google-Cloud, React, Firebase",
    "icon": 62519,
  }
];

class Projects extends StatelessWidget {
  List projectCards = [];
  @override
  Widget build(BuildContext context) {
    for (var rawProject in myProjects) {
      Project project = Project.fromJson(rawProject);
      projectCards.add(Card(
          child: Column(children: <Widget>[
        ListTile(
            leading: Icon(IconData(project.icon, fontFamily: "MaterialIcons")),
            title: Text(project.name),
            subtitle: Text(project.description)),
        Row(children: [
          Text("Languages used: "),
          ...project.languages.split(",").map((e) => Chip(
                label: Text(e),
                backgroundColor: Colors.green[100],
              ))
        ]),
        Row(children: [
          Text("APIs used: "),
          ...project.apis.split(",").map((e) => Chip(
                label: Text(e),
                backgroundColor: Colors.blue[100],
              ))
        ]),
        Row(
          children: [
            Text('Github: '),
            RichText(
              text: TextSpan(
                  text: project.gitLink,
                  style: TextStyle(color: Colors.purple),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {launch(project.gitLink)}),
            )
          ],
        )
      ])));
    }
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
            children: [...projectCards],
          ),
        ));
  }
}
