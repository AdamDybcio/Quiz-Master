import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_master/features/browse/data/model/quiz.dart';
import 'package:quiz_master/features/browse/presentation/blocs/browse/browse_bloc.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BrowseBloc bloc;

  final quiz1 = Quiz(
    id: 1,
    title: 'Flutter Basics',
    category: 1,
    icon: Icons.code,
    description: 'Step by step guide to Flutter',
  );

  final quiz2 = Quiz(
    id: 2,
    title: 'Dart Advanced',
    category: 1,
    icon: Icons.code,
    description: 'Deep dive into Dart',
  );

  group('BrowseBloc Tests', () {
    setUp(() {
      bloc = BrowseBloc();

      bloc.emit(
        bloc.state.copyWith(
          allQuizzes: [quiz1, quiz2],
          filteredQuizzes: [quiz1, quiz2],
        ),
      );
    });

    test('initial state is empty', () {
      final newBloc = BrowseBloc();
      expect(newBloc.state.allQuizzes, []);
      expect(newBloc.state.filteredQuizzes, []);
      expect(newBloc.state.query, '');
    });

    test('BrowseQueryChanged filters quizzes correctly', () async {
      bloc.add(const BrowseQueryChanged('flutter'));

      await expectLater(
        bloc.stream,
        emits(bloc.state.copyWith(filteredQuizzes: [quiz1], query: 'flutter')),
      );
    });

    test('BrowseReset resets filtered quizzes', () async {
      bloc.emit(
        bloc.state.copyWith(filteredQuizzes: [quiz1], query: 'flutter'),
      );

      bloc.add(BrowseReset());

      await expectLater(
        bloc.stream,
        emits(bloc.state.copyWith(filteredQuizzes: [quiz1, quiz2], query: '')),
      );
    });
  });
}
