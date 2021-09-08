import 'package:flutter/material.dart';

class Project {
  Project({
    required this.name,
    required this.description,
    required this.gitLink,
    required this.languages,
    required this.apis,
    required this.icon,
  });

  Project.fromJson(Map<String, Object?> json)
      : this(
            name: json['name']! as String,
            description: json['description'] as String,
            gitLink: json['gitLink']! as String,
            languages: json['languages']! as String,
            apis: json['apis']! as String,
            icon: json['icon'] as int);

  final String name;
  final String description;
  final String gitLink;
  final String languages;
  final String apis;
  final int icon;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'description': description,
      'gitLink': gitLink,
      'languages': languages,
      'apis': apis,
      'icon': icon,
    };
  }
}
