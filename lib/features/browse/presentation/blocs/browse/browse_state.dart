part of 'browse_bloc.dart';

class BrowseState extends Equatable {
  final List<Quiz> allQuizzes;
  final List<Quiz> filteredQuizzes;
  final String query;

  const BrowseState({
    required this.allQuizzes,
    required this.filteredQuizzes,
    required this.query,
  });

  factory BrowseState.initial() {
    return BrowseState(allQuizzes: [], filteredQuizzes: [], query: '');
  }

  BrowseState copyWith({
    List<Quiz>? allQuizzes,
    List<Quiz>? filteredQuizzes,
    String? query,
  }) {
    return BrowseState(
      allQuizzes: allQuizzes ?? this.allQuizzes,
      filteredQuizzes: filteredQuizzes ?? this.filteredQuizzes,
      query: query ?? this.query,
    );
  }

  @override
  List<Object> get props => [allQuizzes, filteredQuizzes, query];
}
