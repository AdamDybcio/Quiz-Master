import 'package:flutter/material.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class Helpers {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String getResultText(BuildContext context, double percentage) {
    final l10n = AppLocalizations.of(context)!;

    if (percentage >= 0.9) return l10n.resultExcellent;
    if (percentage >= 0.75) return l10n.resultVeryGood;
    if (percentage >= 0.6) return l10n.resultGood;
    if (percentage >= 0.4) return l10n.resultAverage;
    if (percentage >= 0.2) return l10n.resultPoor;
    return l10n.resultVeryPoor;
  }

  static double calculateXp({
    required double accuracy,
    required double avgAnswerTime,
    required int totalQuestions,
    required double difficultyMultiplier,
  }) {
    const baseXpPerQuestion = 10.0;

    final speedMultiplier = (10 / avgAnswerTime).clamp(1.0, 2.0);

    double xp =
        totalQuestions *
        baseXpPerQuestion *
        accuracy *
        difficultyMultiplier *
        speedMultiplier;

    if (accuracy == 1.0) {
      xp += 100 * difficultyMultiplier;
    }

    return xp.roundToDouble();
  }
}
