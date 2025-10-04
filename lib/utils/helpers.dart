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
}
