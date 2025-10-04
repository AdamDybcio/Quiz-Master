part of 'user_level_bloc.dart';

abstract class UserLevelEvent extends Equatable {
  const UserLevelEvent();

  @override
  List<Object?> get props => [];
}

class AddXp extends UserLevelEvent {
  final int xp;

  const AddXp(this.xp);

  @override
  List<Object?> get props => [xp];
}

class ResetLevel extends UserLevelEvent {}
