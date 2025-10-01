import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.dark));

  void setThemeMode(ThemeMode mode) => emit(ThemeState(themeMode: mode));

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final modeString = json['themeMode'] as String?;
    switch (modeString) {
      case 'light':
        return const ThemeState(themeMode: ThemeMode.light);
      case 'dark':
        return const ThemeState(themeMode: ThemeMode.dark);
      default:
        return const ThemeState(themeMode: ThemeMode.dark);
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    final modeString = switch (state.themeMode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'dark',
    };
    return {'themeMode': modeString};
  }
}
