import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/domain/repository/quiz_repository.dart';

class GetQuiz {
  final QuizRepository repository;

  GetQuiz(this.repository);

  Future<List<Question>> call(QuizParams params) async {
    return await repository.fetchQuiz(params);
  }
}
