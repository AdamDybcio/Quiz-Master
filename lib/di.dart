import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_master/core/presentation/blocs/page_index_cubit.dart';
import 'package:quiz_master/core/presentation/blocs/theme_cubit.dart';
import 'package:quiz_master/features/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:quiz_master/features/quiz/data/repository/quiz_repository_impl.dart';
import 'package:quiz_master/features/quiz/domain/repository/quiz_repository.dart';
import 'package:quiz_master/features/quiz/domain/usecase/get_quiz.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz/quiz_cubit.dart';

final GetIt sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<QuizRemoteDataSource>(
    () => QuizRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(remoteDataSource: sl<QuizRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => GetQuiz(sl<QuizRepository>()));
  sl.registerFactory(() => QuizCubit(getQuiz: sl<GetQuiz>()));

  sl.registerLazySingleton(() => ThemeCubit());
  sl.registerLazySingleton(() => PageIndexCubit());
}
