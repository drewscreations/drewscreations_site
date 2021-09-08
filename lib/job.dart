import 'package:flutter/material.dart';

class Job {
  Job({
    required this.name,
    required this.company,
    required this.details,
    required this.dates,
  });

  Job.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          company: json['company'] as String,
          details: json['details']! as List<String>,
          dates: json['dates'] as String,
        );

  final String name;
  final String company;
  final List<String> details;
  final String dates;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'company': company,
      'details': details,
      'dates': dates,
    };
  }
}
