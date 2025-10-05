import 'package:flutter/material.dart';
import 'package:quiz_master/utils/enums.dart';

class Achievement {
  final AchievementCategory category;
  final AchievementLevel level;
  final String title;
  final String description;
  final IconData icon;

  const Achievement({
    required this.category,
    required this.level,
    required this.title,
    required this.description,
    required this.icon,
  });
}
