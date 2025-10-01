import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';

abstract class QuizRepository {
  Future<List<Question>> fetchQuiz(QuizParams params);
}
