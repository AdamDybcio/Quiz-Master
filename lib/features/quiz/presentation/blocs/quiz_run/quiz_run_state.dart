import 'package:quiz_master/features/quiz/domain/entity/question.dart';

class QuizRunState {
  final List<Question> questions;
  final int currentIndex;
  final int score;
  final int timeLeft;
  final bool lifelineFiftyFiftyAvailable;
  final bool lifelineSkipAvailable;
  final bool showResults;

  final List<String> disabledAnswers;

  QuizRunState({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.timeLeft = 30,
    this.lifelineFiftyFiftyAvailable = true,
    this.lifelineSkipAvailable = true,
    this.showResults = false,
    this.disabledAnswers = const [],
  });

  QuizRunState copyWith({
    List<Question>? questions,
    int? currentIndex,
    int? score,
    int? timeLeft,
    bool? lifelineFiftyFiftyAvailable,
    bool? lifelineSkipAvailable,
    bool? showResults,
    List<String>? disabledAnswers,
  }) {
    return QuizRunState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      lifelineFiftyFiftyAvailable:
          lifelineFiftyFiftyAvailable ?? this.lifelineFiftyFiftyAvailable,
      lifelineSkipAvailable:
          lifelineSkipAvailable ?? this.lifelineSkipAvailable,
      showResults: showResults ?? this.showResults,
      disabledAnswers: disabledAnswers ?? this.disabledAnswers,
    );
  }
}
