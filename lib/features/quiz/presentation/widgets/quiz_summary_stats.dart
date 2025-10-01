import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class QuizSummaryStats extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Duration totalTime;

  const QuizSummaryStats({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    final accuracy = totalQuestions > 0
        ? (score / totalQuestions * 100).round()
        : 0;
    final avgTimePerQuestion = totalQuestions > 0
        ? totalTime.inSeconds ~/ totalQuestions
        : 0;

    Widget buildStatTile(
      IconData icon,
      String title,
      String value,
      Color color,
    ) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Helpers.isDarkMode(context)
              ? Colors.grey.shade900
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Helpers.isDarkMode(context)
                ? Colors.grey.shade800
                : Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Helpers.isDarkMode(context)
                    ? Colors.white70
                    : Colors.black54,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: Helpers.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Responsive(
        mobile: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildStatTile(
                FontAwesomeIcons.circleCheck,
                AppLocalizations.of(context)!.accuracy,
                "$accuracy%",
                Colors.deepPurpleAccent,
              ),
              buildStatTile(
                FontAwesomeIcons.clock,
                AppLocalizations.of(context)!.totalTime,
                "${totalTime.inMinutes}m ${totalTime.inSeconds % 60}s",
                Colors.teal,
              ),
              buildStatTile(
                FontAwesomeIcons.bolt,
                AppLocalizations.of(context)!.avgTime,
                "${avgTimePerQuestion}s",
                Colors.teal,
              ),
            ],
          ),
        ),
        tablet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.circleCheck,
                  AppLocalizations.of(context)!.accuracy,
                  "$accuracy%",
                  Colors.deepPurpleAccent,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.clock,
                  AppLocalizations.of(context)!.totalTime,
                  "${totalTime.inMinutes}m ${totalTime.inSeconds % 60}s",
                  Colors.teal,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.bolt,
                  AppLocalizations.of(context)!.avgTime,
                  "${avgTimePerQuestion}s",
                  Colors.teal,
                ),
              ),
            ],
          ),
        ),
        desktop: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.circleCheck,
                  AppLocalizations.of(context)!.accuracy,
                  "$accuracy%",
                  Colors.deepPurpleAccent,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.clock,
                  AppLocalizations.of(context)!.totalTime,
                  "${totalTime.inMinutes}m ${totalTime.inSeconds % 60}s",
                  Colors.teal,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.bolt,
                  AppLocalizations.of(context)!.avgTime,
                  "${avgTimePerQuestion}s",
                  Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
