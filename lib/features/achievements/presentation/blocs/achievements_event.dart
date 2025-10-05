part of 'achievements_bloc.dart';

abstract class AchievementsEvent {}

class CheckAchievements extends AchievementsEvent {
  final int quizCount;
  final int correctAnswers;
  final int level;
  final int quizTimeSeconds;

  CheckAchievements({
    required this.quizCount,
    required this.correctAnswers,
    required this.level,
    required this.quizTimeSeconds,
  });
}
