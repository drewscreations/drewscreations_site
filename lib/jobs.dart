import 'package:drewsreations_site/job.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

class Jobs extends StatelessWidget {
  List jobCards = [];
  @override
  Widget build(BuildContext context) {
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
            children: [...jobCards],
          ),
        ));
  }
}
