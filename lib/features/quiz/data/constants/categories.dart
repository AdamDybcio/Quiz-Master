import 'package:flutter/material.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class QuizCategory {
  final int id;
  final String name;
  final String icon;

  const QuizCategory(this.id, this.name, this.icon);
}

List<QuizCategory> getCategories(BuildContext context) {
  return [
    QuizCategory(
      9,
      AppLocalizations.of(context)!.categoryGeneralKnowledge,
      '🧠',
    ),
    QuizCategory(
      17,
      AppLocalizations.of(context)!.categoryScienceAndNature,
      '🔬',
    ),
    QuizCategory(21, AppLocalizations.of(context)!.categorySports, '⚽'),
    QuizCategory(23, AppLocalizations.of(context)!.categoryHistory, '📚'),
    QuizCategory(22, AppLocalizations.of(context)!.categoryGeography, '🌍'),
    QuizCategory(27, AppLocalizations.of(context)!.categoryAnimals, '🦁'),
    QuizCategory(18, AppLocalizations.of(context)!.categoryComputers, '💻'),
    QuizCategory(11, AppLocalizations.of(context)!.categoryFilm, '🎬'),
  ];
}
