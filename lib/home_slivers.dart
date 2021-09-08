import 'package:drewsreations_site/job.dart';
import 'package:drewsreations_site/project.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSlivers extends StatelessWidget {
  SliverAppBar nameSliver = SliverAppBar();
  List projectCards = [];
  List jobCards = [];
  SliverAppBar aboutMeSliver = SliverAppBar();
  SliverList jobsSliver = SliverList(delegate: SliverChildListDelegate([]));
  SliverList projectsSliver = SliverList(delegate: SliverChildListDelegate([]));
  SliverList informationSliver =
      SliverList(delegate: SliverChildListDelegate([]));

  @override
  Widget build(BuildContext context) {
    nameSliver = SliverAppBar(
      stretch: true,
      onStretchTrigger: () {
        return Future<void>.value();
      },
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle
        ],
        centerTitle: true,
        title: RichText(
            text: TextSpan(children: [
          TextSpan(text: "Full Stack Web, Hardware Test Engineer, Physics"),
          TextSpan(text: "Drew Olson", style: TextStyle()),
        ])),
        background: Stack(fit: StackFit.expand, children: [
          const DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0.0, 0.5),
                      end: Alignment(0.0, 0.0),
                      colors: <Color>[Colors.cyan, Colors.cyanAccent])))
        ]),
      ),
    );
    for (var rawProject in myProjects) {
      Project project = Project.fromJson(rawProject);
      List apiChips = [
        ...project.apis.split(",").map((e) => Chip(
              label: Text(e),
              backgroundColor: Colors.blue[100],
            ))
      ];
      List languageChips = [
        ...project.languages.split(",").map((e) => Chip(
              label: Text(e),
              backgroundColor: Colors.green[100],
            ))
      ];
      projectCards.add(Card(
          child: Column(children: <Widget>[
        ListTile(
            leading: Icon(IconData(project.icon, fontFamily: "MaterialIcons")),
            title: Text(project.name),
            subtitle: Text(project.description)),
        Row(children: [Text("Languages used: "), ...languageChips]),
        Row(children: [Text("APIs used: "), ...apiChips.take(3)]),
        /*
        ListView(
          scrollDirection: Axis.horizontal,
          children: [...apiChips],
          shrinkWrap: true,
        ),
        */
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
    projectsSliver =
        SliverList(delegate: SliverChildListDelegate([...projectCards]));
    for (var rawJob in myJobs) {
      Job job = Job.fromJson(rawJob);
      jobCards.add(Card(
          child: Column(children: <Widget>[
        ListTile(title: Text(job.name), subtitle: Text(job.dates)),
        Column(children: [
          ...job.details.map(
              (e) => Align(alignment: Alignment.centerLeft, child: Text(e)))
        ]),
      ])));
    }
    jobsSliver = SliverList(delegate: SliverChildListDelegate([...jobCards]));
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              nameSliver,
              SliverAppBar(title: Text("Projects")),
              projectsSliver,
              SliverAppBar(title: Text("Jobs")),
              jobsSliver,
              SliverAppBar(title: Text("More Information")),
              informationSliver
            ]));
  }
}

//filler text
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

List myJobs = [
  {
    "name": "Hardware Test Engineer",
    "company": "Microsoft",
    "details": [
      'Collect and analyze power, latency, kinetic, and thermal measurements. Organize and identify trends in data using python. Utilize various libraries for data manipulation such as pandas, matplotlib, and numpy. Prepare concise, data-driven solutions for Project Manager in Azure DevOps.',
      'Model system power and effective battery life against firmware and hardware design choices.',
      'Rapidly prototype custom robotics, controlled with with python and C#, used in device verification procedures. Utilized pyusb for control transfer, tkinter for custom gui, and custom libraries for HID interface. Leverage custom api for reliable Bluetooth Low Energy communication at IOT level in python.',
      'Modify device telemetry using force sensors and electromagnetic actuators. Coordinate with Firmware Engineers to reduce latency and minimize waveform artefacts.',
      'Brainstorm with Mechanical and Electrical Engineering departments on hardware metrics, design specifications, and user experience requirements.'
    ],
    "dates": "2020-2021"
  },
  {
    "name": "Developer Curriculum",
    "company": "Coding Dojo ",
    "details": [
      'Organize and lead a team of cohorts to create a game using C# in Unity. Utilized PlasticSCM for images and Unity asset storage. Used Git for multi-user code management.',
      'Design and deploy full stack web applications in React, Django, and ASP.NET. Used local hosting, AWS elastic beanstalk, and Google Firebase.',
      'Combined RESTful API with dynamic views on a Single Page Application to update user information server side in real time. '
    ],
    "dates": "2020"
  },
  {
    "name": "Test Technician",
    "company": "Stryker",
    "details": [
      'Collaborate with Engineering departments to create documentation for testing and verification of various sensors including Heart Rate, SpO2, EKG, Blood Pressure, etc.',
      'Operated pressure chambers, temperature chambers, and hydraulic and electromagnetic actuators to verify integrity and compliance of medical devices in extreme environments. ',
      'Maintained and operated the vibration table and accelerometer assembly to perform vibration tests in multiple dimensions.'
    ],
    "dates": "2019-2020"
  },
  {
    "name": "Physics Curriculum",
    "company": "University of Washington",
    "details": [
      'Program PIC microcontroller with assembly language to control advanced logic and timing circuits. Troubleshoot and correct various assembly code projects, including memory management.',
      'Evaluate the spectral signature of an unknown light source using an optical spectrometer. Analyze laser patterns from CMOS linear image detector using R.',
      'Design proof of concept for and assemble laser activated transmission holograms.'
    ],
    "dates": "2017-2019"
  },
  {
    "name": "Associates of Science Curriculum",
    "company": "Olympic College",
    "details": [
      'Lead a team through the development of a PWA using React and AWS Amplify.',
      'Design and build Augmented Reality game using Unity3D and Microsoft HoloLens.'
    ],
    "dates": "2015-2017"
  },
  {
    "name": "Reactor Operator",
    "company": "US Navy",
    "details": [
      'Manage, mentor, and lead an engineering team with a focus on maintaining low voltage electronics, electromagnetic and hydraulic actuators, and identifying component level failures.',
      'Utilize the 7 step troubleshooting method to identify problems, draft a solution, supervise the repair, and verify results.',
      'Identify and repair circuit board level malfunctions using benchtop measurement devices such as Oscilloscope, Multimeter, Megger, Time-Domain Reflectometer, etc.'
    ],
    "dates": "2009-2015"
  },
];
