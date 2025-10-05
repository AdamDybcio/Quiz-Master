import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_master/features/achievements/presentation/blocs/achievements_bloc.dart';
import 'package:quiz_master/utils/enums.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;
  late AchievementsBloc bloc;

  setUp(() {
    storage = MockStorage();
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    HydratedBloc.storage = storage;

    bloc = AchievementsBloc();
  });

  group('AchievementsBloc', () {
    test('initial state is empty', () {
      expect(bloc.state.unlockedLevels, {});
      expect(bloc.state.totalQuizzes, 0);
      expect(bloc.state.totalCorrectAnswers, 0);
      expect(bloc.state.currentLevel, 1);
      expect(bloc.state.bestQuizTimeSeconds, 9999);
    });

    test('CheckAchievements unlocks leveling achievements correctly', () {
      bloc.add(
        CheckAchievements(
          quizCount: 0,
          correctAnswers: 0,
          level: 5,
          quizTimeSeconds: 999,
        ),
      );
      bloc.stream.listen(
        expectAsync1((state) {
          expect(
            state.unlockedLevels[AchievementCategory.leveling],
            AchievementLevel.bronze,
          );
        }),
      );
    });

    test('CheckAchievements unlocks answerMaster achievements correctly', () {
      bloc.add(
        CheckAchievements(
          quizCount: 0,
          correctAnswers: 50,
          level: 1,
          quizTimeSeconds: 999,
        ),
      );
      bloc.stream.listen(
        expectAsync1((state) {
          expect(
            state.unlockedLevels[AchievementCategory.answerMaster],
            AchievementLevel.gold,
          );
        }),
      );
    });

    test('CheckAchievements unlocks quizAbuser achievements correctly', () {
      bloc.add(
        CheckAchievements(
          quizCount: 25,
          correctAnswers: 0,
          level: 1,
          quizTimeSeconds: 999,
        ),
      );
      bloc.stream.listen(
        expectAsync1((state) {
          expect(
            state.unlockedLevels[AchievementCategory.quizAbuser],
            AchievementLevel.gold,
          );
        }),
      );
    });

    test('CheckAchievements unlocks speedster achievements correctly', () {
      bloc.add(
        CheckAchievements(
          quizCount: 0,
          correctAnswers: 0,
          level: 1,
          quizTimeSeconds: 30,
        ),
      );
      bloc.stream.listen(
        expectAsync1((state) {
          expect(
            state.unlockedLevels[AchievementCategory.speedster],
            AchievementLevel.platinum,
          );
        }),
      );
    });

    test('CheckAchievements updates totals and bestQuizTimeSeconds', () {
      bloc.add(
        CheckAchievements(
          quizCount: 3,
          correctAnswers: 5,
          level: 2,
          quizTimeSeconds: 50,
        ),
      );
      bloc.stream.listen(
        expectAsync1((state) {
          expect(state.totalQuizzes, 3);
          expect(state.totalCorrectAnswers, 5);
          expect(state.currentLevel, 2);
          expect(state.bestQuizTimeSeconds, 50);
        }),
      );
    });

    test('fromJson and toJson work correctly', () {
      final state = AchievementsState(
        unlockedLevels: {AchievementCategory.leveling: AchievementLevel.bronze},
        totalQuizzes: 1,
        totalCorrectAnswers: 2,
        currentLevel: 3,
        bestQuizTimeSeconds: 100,
      );
      final json = bloc.toJson(state)!;
      final newState = bloc.fromJson(json)!;
      expect(newState.unlockedLevels, state.unlockedLevels);
      expect(newState.totalQuizzes, state.totalQuizzes);
      expect(newState.totalCorrectAnswers, state.totalCorrectAnswers);
      expect(newState.currentLevel, state.currentLevel);
      expect(newState.bestQuizTimeSeconds, state.bestQuizTimeSeconds);
    });
  });
}
