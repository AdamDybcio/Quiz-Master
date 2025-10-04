part of 'user_level_bloc.dart';

class UserLevelState extends Equatable {
  final int level;
  final int currentXp;

  const UserLevelState({this.level = 1, this.currentXp = 0});

  @override
  List<Object> get props => [level, currentXp];

  UserLevelState copyWith({int? level, int? currentXp}) {
    return UserLevelState(
      level: level ?? this.level,
      currentXp: currentXp ?? this.currentXp,
    );
  }

  Map<String, dynamic> toJson() => {'level': level, 'currentXp': currentXp};

  static UserLevelState fromJson(Map<String, dynamic> json) {
    return UserLevelState(
      level: json['level'] as int? ?? 1,
      currentXp: json['currentXp'] as int? ?? 0,
    );
  }
}
