import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';

import '../model/question_model.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuestionModel>> fetchQuiz(QuizParams params);
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  static const String baseUrl = 'https://opentdb.com/api.php';

  final http.Client client;

  QuizRemoteDataSourceImpl({required this.client});

  @override
  Future<List<QuestionModel>> fetchQuiz(QuizParams params) async {
    final queryParams = {
      'amount': params.amount.toString(),
      if (params.category != null) 'category': params.category.toString(),
      if (params.difficulty != null) 'difficulty': params.difficulty!,
      if (params.type != null) 'type': params.type!,
    };

    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);

    final response = await client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch quiz questions');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;

    if (data['response_code'] != 0) {
      throw Exception('No questions available for these parameters');
    }

    final results = data['results'] as List;
    return results.map((e) => QuestionModel.fromJson(e)).toList();
  }
}
