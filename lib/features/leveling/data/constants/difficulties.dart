import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class Difficulties {
  final String title;
  final double multiplier;
  final String description;
  final IconData icon;
  final String apiValue;

  const Difficulties(
    this.title,
    this.multiplier,
    this.description,
    this.icon,
    this.apiValue,
  );
}

List<Difficulties> getDifficulties(BuildContext context) {
  return [
    Difficulties(
      AppLocalizations.of(context)!.difficultyEasy,
      1.0,
      AppLocalizations.of(context)!.difficultyEasyDescription,
      FontAwesomeIcons.brain,
      "easy",
    ),
    Difficulties(
      AppLocalizations.of(context)!.difficultyMedium,
      1.5,
      AppLocalizations.of(context)!.difficultyMediumDescription,
      FontAwesomeIcons.bolt,
      "medium",
    ),
    Difficulties(
      AppLocalizations.of(context)!.difficultyHard,
      2.0,
      AppLocalizations.of(context)!.difficultyHardDescription,
      FontAwesomeIcons.fireFlameCurved,
      "hard",
    ),
  ];
}
