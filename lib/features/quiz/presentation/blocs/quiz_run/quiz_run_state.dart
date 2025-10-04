import 'package:quiz_master/features/quiz/domain/entity/question.dart';

class QuizRunState {
  final List<Question> questions;
  final int currentIndex;
  final int score;
  final int timeLeft;
  final bool lifelineFiftyFiftyAvailable;
  final bool lifelineSkipAvailable;
  final bool showResults;
  final int timePerQuestion;
  final bool isLocked;
  final String? selectedAnswer;

  final List<String> disabledAnswers;

  final Duration totalElapsedTime;
  final List<int> answerTimes;
  final List<String?> userAnswers;

  QuizRunState({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.timeLeft = 30,
    this.lifelineFiftyFiftyAvailable = true,
    this.lifelineSkipAvailable = true,
    this.showResults = false,
    this.disabledAnswers = const [],
    this.totalElapsedTime = Duration.zero,
    this.answerTimes = const [],
    this.userAnswers = const [],
    this.timePerQuestion = 20,
    this.isLocked = false,
    this.selectedAnswer,
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
    Duration? totalElapsedTime,
    List<int>? answerTimes,
    List<String?>? userAnswers,
    int? timePerQuestion,
    bool? isLocked,
    String? selectedAnswer,
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
      totalElapsedTime: totalElapsedTime ?? this.totalElapsedTime,
      answerTimes: answerTimes ?? this.answerTimes,
      userAnswers: userAnswers ?? this.userAnswers,
      timePerQuestion: timePerQuestion ?? this.timePerQuestion,
      isLocked: isLocked ?? this.isLocked,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }
}
