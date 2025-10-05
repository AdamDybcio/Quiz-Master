import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/achievements/presentation/blocs/achievements_bloc.dart';
import 'package:quiz_master/features/leveling/data/constants/difficulties.dart';
import 'package:quiz_master/features/leveling/presentation/blocs/user_level/user_level_bloc.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class QuizSummaryStats extends StatelessWidget {
  final int score;
  final Duration totalTime;
  final List<int> answerTimes;
  final Difficulties difficulty;
  final int totalQuestions;

  const QuizSummaryStats({
    super.key,
    required this.score,
    required this.totalTime,
    required this.answerTimes,
    required this.difficulty,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final accuracy = totalQuestions > 0
        ? (score / totalQuestions * 100).round()
        : 0;

    final avgTimePerQuestion = answerTimes.isNotEmpty
        ? answerTimes.reduce((a, b) => a + b) ~/ answerTimes.length
        : 0;

    final experienceEarned = Helpers.calculateXp(
      accuracy: accuracy / 100,
      avgAnswerTime: avgTimePerQuestion.toDouble(),
      totalQuestions: totalQuestions,
      difficultyMultiplier: difficulty.multiplier,
    );

    sl<UserLevelBloc>().add(AddXp(experienceEarned.toInt()));
    final currentLevel = sl<UserLevelBloc>().state.level;
    sl<AchievementsBloc>().add(
      CheckAchievements(
        quizCount: accuracy >= 80 ? 1 : 0,
        correctAnswers: score,
        level: currentLevel,
        quizTimeSeconds: accuracy >= 80 ? totalTime.inSeconds : 9999,
      ),
    );

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
              buildStatTile(
                FontAwesomeIcons.solidStar,
                AppLocalizations.of(context)!.experienceEarned,
                experienceEarned.toStringAsFixed(0),
                Colors.orangeAccent,
              ),
              buildStatTile(
                FontAwesomeIcons.bolt,
                AppLocalizations.of(context)!.difficulty,
                difficulty.title,
                difficulty.apiValue == 'easy'
                    ? Colors.green
                    : difficulty.apiValue == 'medium'
                    ? Colors.yellow
                    : Colors.red,
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
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.solidStar,
                  AppLocalizations.of(context)!.experienceEarned,
                  experienceEarned.toStringAsFixed(0),
                  Colors.orangeAccent,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.bolt,
                  AppLocalizations.of(context)!.difficulty,
                  difficulty.title,
                  difficulty.apiValue == 'easy'
                      ? Colors.green
                      : difficulty.apiValue == 'medium'
                      ? Colors.yellow
                      : Colors.red,
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
                  FontAwesomeIcons.clock,
                  AppLocalizations.of(context)!.totalTime,
                  "${totalTime.inMinutes}m ${totalTime.inSeconds % 60}s",
                  Colors.deepPurpleAccent,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.brain,
                  AppLocalizations.of(context)!.avgTime,
                  "${avgTimePerQuestion}s",
                  Colors.teal,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.solidStar,
                  AppLocalizations.of(context)!.experienceEarned,
                  experienceEarned.toStringAsFixed(0),
                  Colors.orangeAccent,
                ),
              ),
              Expanded(
                child: buildStatTile(
                  FontAwesomeIcons.bolt,
                  AppLocalizations.of(context)!.difficulty,
                  difficulty.title,
                  difficulty.apiValue == 'easy'
                      ? Colors.green
                      : difficulty.apiValue == 'medium'
                      ? Colors.yellow
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
