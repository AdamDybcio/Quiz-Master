import 'package:flutter/material.dart';

class Quiz {
  final int id;
  final String title;
  final int category;
  final IconData icon;
  final String description;

  const Quiz({
    required this.id,
    required this.title,
    required this.category,
    required this.icon,
    required this.description,
  });
}
