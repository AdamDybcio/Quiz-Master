import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quiz_master/utils/enums.dart';

part 'achievements_event.dart';
part 'achievements_state.dart';

class AchievementsBloc
    extends HydratedBloc<AchievementsEvent, AchievementsState> {
  AchievementsBloc() : super(const AchievementsState()) {
    on<CheckAchievements>(_onCheckAchievements);
  }

  void _onCheckAchievements(
    CheckAchievements event,
    Emitter<AchievementsState> emit,
  ) {
    final unlocked = Map<AchievementCategory, AchievementLevel>.from(
      state.unlockedLevels,
    );

    final totalQuizzes = state.totalQuizzes + event.quizCount;
    final totalCorrectAnswers =
        state.totalCorrectAnswers + event.correctAnswers;
    final currentLevel = event.level;
    final bestQuizTimeSeconds =
        event.quizTimeSeconds < state.bestQuizTimeSeconds
        ? event.quizTimeSeconds
        : state.bestQuizTimeSeconds;

    if (currentLevel >= 5) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.leveling,
        AchievementLevel.bronze,
      );
    }
    if (currentLevel >= 10) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.leveling,
        AchievementLevel.silver,
      );
    }
    if (currentLevel >= 20) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.leveling,
        AchievementLevel.gold,
      );
    }
    if (currentLevel >= 30) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.leveling,
        AchievementLevel.platinum,
      );
    }
    if (currentLevel >= 50) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.leveling,
        AchievementLevel.diamond,
      );
    }
    if (currentLevel >= 100) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.leveling,
        AchievementLevel.master,
      );
    }

    if (totalCorrectAnswers >= 10) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.answerMaster,
        AchievementLevel.bronze,
      );
    }
    if (totalCorrectAnswers >= 25) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.answerMaster,
        AchievementLevel.silver,
      );
    }
    if (totalCorrectAnswers >= 50) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.answerMaster,
        AchievementLevel.gold,
      );
    }
    if (totalCorrectAnswers >= 100) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.answerMaster,
        AchievementLevel.platinum,
      );
    }
    if (totalCorrectAnswers >= 200) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.answerMaster,
        AchievementLevel.diamond,
      );
    }
    if (totalCorrectAnswers >= 500) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.answerMaster,
        AchievementLevel.master,
      );
    }

    if (totalQuizzes >= 5) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.quizAbuser,
        AchievementLevel.bronze,
      );
    }
    if (totalQuizzes >= 10) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.quizAbuser,
        AchievementLevel.silver,
      );
    }
    if (totalQuizzes >= 25) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.quizAbuser,
        AchievementLevel.gold,
      );
    }
    if (totalQuizzes >= 50) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.quizAbuser,
        AchievementLevel.platinum,
      );
    }
    if (totalQuizzes >= 100) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.quizAbuser,
        AchievementLevel.diamond,
      );
    }
    if (totalQuizzes >= 250) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.quizAbuser,
        AchievementLevel.master,
      );
    }

    if (bestQuizTimeSeconds <= 60) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.speedster,
        AchievementLevel.bronze,
      );
    }
    if (bestQuizTimeSeconds <= 45) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.speedster,
        AchievementLevel.silver,
      );
    }
    if (bestQuizTimeSeconds <= 30) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.speedster,
        AchievementLevel.gold,
      );
    }
    if (bestQuizTimeSeconds <= 20) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.speedster,
        AchievementLevel.platinum,
      );
    }
    if (bestQuizTimeSeconds <= 10) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.speedster,
        AchievementLevel.diamond,
      );
    }
    if (bestQuizTimeSeconds <= 5) {
      _unlockIfHigher(
        unlocked,
        AchievementCategory.speedster,
        AchievementLevel.master,
      );
    }

    emit(
      state.copyWith(
        unlockedLevels: unlocked,
        totalQuizzes: totalQuizzes,
        totalCorrectAnswers: totalCorrectAnswers,
        currentLevel: currentLevel,
        bestQuizTimeSeconds: bestQuizTimeSeconds,
      ),
    );
  }

  void _unlockIfHigher(
    Map<AchievementCategory, AchievementLevel> map,
    AchievementCategory category,
    AchievementLevel level,
  ) {
    final current = map[category];
    if (current == null || level.index > current.index) {
      map[category] = level;
    }
  }

  @override
  AchievementsState? fromJson(Map<String, dynamic> json) =>
      AchievementsState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AchievementsState state) => state.toMap();
}
