part of 'achievements_bloc.dart';

class AchievementsState {
  final Map<AchievementCategory, AchievementLevel> unlockedLevels;
  final int totalQuizzes;
  final int totalCorrectAnswers;
  final int currentLevel;
  final int bestQuizTimeSeconds;

  const AchievementsState({
    this.unlockedLevels = const {},
    this.totalQuizzes = 0,
    this.totalCorrectAnswers = 0,
    this.currentLevel = 1,
    this.bestQuizTimeSeconds = 9999,
  });

  AchievementsState copyWith({
    Map<AchievementCategory, AchievementLevel>? unlockedLevels,
    int? totalQuizzes,
    int? totalCorrectAnswers,
    int? currentLevel,
    int? bestQuizTimeSeconds,
  }) {
    return AchievementsState(
      unlockedLevels: unlockedLevels ?? this.unlockedLevels,
      totalQuizzes: totalQuizzes ?? this.totalQuizzes,
      totalCorrectAnswers: totalCorrectAnswers ?? this.totalCorrectAnswers,
      currentLevel: currentLevel ?? this.currentLevel,
      bestQuizTimeSeconds: bestQuizTimeSeconds ?? this.bestQuizTimeSeconds,
    );
  }

  Map<String, dynamic> toMap() => {
    'unlockedLevels': unlockedLevels.map((k, v) => MapEntry(k.name, v.name)),
    'totalQuizzes': totalQuizzes,
    'totalCorrectAnswers': totalCorrectAnswers,
    'currentLevel': currentLevel,
    'bestQuizTimeSeconds': bestQuizTimeSeconds,
  };

  factory AchievementsState.fromMap(Map<String, dynamic> map) {
    final raw = (map['unlockedLevels'] as Map?)?.cast<String, String>() ?? {};
    final parsed = <AchievementCategory, AchievementLevel>{};
    for (final e in raw.entries) {
      parsed[AchievementCategory.values.byName(e.key)] = AchievementLevel.values
          .byName(e.value);
    }
    return AchievementsState(
      unlockedLevels: parsed,
      totalQuizzes: map['totalQuizzes'] ?? 0,
      totalCorrectAnswers: map['totalCorrectAnswers'] ?? 0,
      currentLevel: map['currentLevel'] ?? 1,
      bestQuizTimeSeconds: map['bestQuizTimeSeconds'] ?? 9999,
    );
  }
}
