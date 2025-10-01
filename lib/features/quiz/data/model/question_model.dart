import 'package:quiz_master/features/quiz/domain/entity/question.dart';

class QuestionModel extends Question {
  final List<String> _shuffledAnswers;

  QuestionModel({
    required super.category,
    required super.type,
    required super.difficulty,
    required super.question,
    required super.correctAnswer,
    required super.incorrectAnswers,
  }) : _shuffledAnswers = ([correctAnswer, ...incorrectAnswers]..shuffle());

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: _decodeHtml(json['question']),
      correctAnswer: _decodeHtml(json['correct_answer']),
      incorrectAnswers: (json['incorrect_answers'] as List)
          .map((e) => _decodeHtml(e as String))
          .toList(),
    );
  }

  static String _decodeHtml(String text) {
    return text
        .replaceAll('&quot;', '"')
        .replaceAll('&#039;', "'")
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }

  List<String> get allAnswers => _shuffledAnswers;
}
