import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_level_event.dart';
part 'user_level_state.dart';

class UserLevelBloc extends HydratedBloc<UserLevelEvent, UserLevelState> {
  final int baseXp;
  final double exponent;

  UserLevelBloc({this.baseXp = 100, this.exponent = 1.3})
    : super(const UserLevelState()) {
    on<AddXp>(_onAddXp);
    on<ResetLevel>(_onResetLevel);
  }

  int xpToNextLevel(int level) => (baseXp * pow(level, exponent)).round();

  void _onAddXp(AddXp event, Emitter<UserLevelState> emit) {
    int newXp = state.currentXp + event.xp;
    int newLevel = state.level;

    while (newXp >= xpToNextLevel(newLevel)) {
      newXp -= xpToNextLevel(newLevel);
      newLevel += 1;
    }

    emit(state.copyWith(level: newLevel, currentXp: newXp));
  }

  void _onResetLevel(ResetLevel event, Emitter<UserLevelState> emit) {
    emit(const UserLevelState());
  }

  @override
  UserLevelState? fromJson(Map<String, dynamic> json) =>
      UserLevelState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(UserLevelState state) => state.toJson();
}
