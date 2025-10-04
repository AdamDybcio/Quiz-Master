import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_master/features/browse/data/constants/quizzes.dart';
import 'package:quiz_master/features/browse/data/model/quiz.dart';

part 'browse_event.dart';
part 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc() : super(BrowseState.initial()) {
    on<BrowseQueryChanged>(_onQueryChanged);
    on<BrowseReset>(_onReset);
    on<BrowseLoad>(_onLoad);
  }

  void _onQueryChanged(BrowseQueryChanged event, Emitter<BrowseState> emit) {
    final query = event.query.toLowerCase();

    final filtered = state.allQuizzes.where((quiz) {
      return quiz.title.toLowerCase().contains(query) ||
          quiz.description.toLowerCase().contains(query);
    }).toList();

    emit(state.copyWith(filteredQuizzes: filtered, query: event.query));
  }

  void _onReset(BrowseReset event, Emitter<BrowseState> emit) {
    emit(state.copyWith(filteredQuizzes: state.allQuizzes, query: ''));
  }

  void _onLoad(BrowseLoad event, Emitter<BrowseState> emit) {
    emit(
      state.copyWith(
        allQuizzes: Quizzes().getQuizzes(event.context),
        filteredQuizzes: Quizzes().getQuizzes(event.context),
      ),
    );
  }
}
