import 'package:quiz_master/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/domain/repository/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource remoteDataSource;

  QuizRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Question>> fetchQuiz(QuizParams params) {
    return remoteDataSource.fetchQuiz(params);
  }
}
