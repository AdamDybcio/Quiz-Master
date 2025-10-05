import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:quiz_master/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:quiz_master/features/quiz/data/model/question_model.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';

class FakeHttpClient implements http.Client {
  final int statusCode;
  final String body;

  FakeHttpClient({required this.statusCode, required this.body});

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    return http.Response(body, statusCode);
  }

  @override
  void close() {}
  @override
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) => throw UnimplementedError();
  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) =>
      throw UnimplementedError();
  @override
  Future<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) => throw UnimplementedError();
  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) => throw UnimplementedError();
  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) => throw UnimplementedError();
  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) =>
      throw UnimplementedError();
  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) =>
      throw UnimplementedError();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw UnimplementedError();
  }
}

void main() {
  late QuizRemoteDataSourceImpl dataSource;

  group('QuizRemoteDataSourceImpl (unit tests)', () {
    const tParams = QuizParams(amount: 2, category: 9, difficulty: 'easy');

    final validResponseJson = json.encode({
      "response_code": 0,
      "results": [
        {
          "category": "General Knowledge",
          "type": "multiple",
          "difficulty": "easy",
          "question": "What is the capital of France?",
          "correct_answer": "Paris",
          "incorrect_answers": ["London", "Berlin", "Madrid"],
        },
        {
          "category": "Science",
          "type": "boolean",
          "difficulty": "easy",
          "question": "The chemical symbol for water is H2O.",
          "correct_answer": "True",
          "incorrect_answers": ["False"],
        },
      ],
    });

    test('returns a list of QuestionModel when response is valid', () async {
      final fakeClient = FakeHttpClient(
        statusCode: 200,
        body: validResponseJson,
      );
      dataSource = QuizRemoteDataSourceImpl(client: fakeClient);

      final result = await dataSource.fetchQuiz(tParams);

      expect(result, isA<List<QuestionModel>>());
      expect(result.length, 2);
      expect(result.first.correctAnswer, 'Paris');
      expect(result.first.allAnswers.contains('Paris'), true);
      expect(result.first.allAnswers.contains('London'), true);
    });

    test('throws Exception when status code is not 200', () async {
      final fakeClient = FakeHttpClient(statusCode: 500, body: 'Server Error');
      dataSource = QuizRemoteDataSourceImpl(client: fakeClient);

      expect(() => dataSource.fetchQuiz(tParams), throwsA(isA<Exception>()));
    });

    test('throws Exception when response_code != 0', () async {
      final invalidResponse = json.encode({"response_code": 1, "results": []});
      final fakeClient = FakeHttpClient(statusCode: 200, body: invalidResponse);
      dataSource = QuizRemoteDataSourceImpl(client: fakeClient);

      expect(() => dataSource.fetchQuiz(tParams), throwsA(isA<Exception>()));
    });

    test('builds correct URI with all parameters', () async {
      final fakeClient = FakeHttpClient(
        statusCode: 200,
        body: validResponseJson,
      );
      dataSource = QuizRemoteDataSourceImpl(client: fakeClient);

      final uri = Uri.parse('https://opentdb.com/api.php').replace(
        queryParameters: {
          'amount': tParams.amount.toString(),
          'category': tParams.category.toString(),
          'difficulty': tParams.difficulty!,
        },
      );

      final result = await dataSource.fetchQuiz(tParams);
      expect(result, isNotEmpty);
      expect(uri.queryParameters['amount'], '2');
      expect(uri.queryParameters['category'], '9');
      expect(uri.queryParameters['difficulty'], 'easy');
    });
  });
}
