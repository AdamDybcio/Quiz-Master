import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quiz_master/core/presentation/blocs/theme_cubit.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Storage storage;

  group('ThemeCubit tests', () {
    late ThemeCubit cubit;

    setUp(() {
      storage = MockStorage();
      when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
      HydratedBloc.storage = storage;

      cubit = ThemeCubit();
    });

    test('initial state should be ThemeMode.dark', () {
      expect(cubit.state.themeMode, ThemeMode.dark);
    });

    test('setThemeMode should emit correct ThemeState', () {
      cubit.setThemeMode(ThemeMode.light);
      expect(cubit.state.themeMode, ThemeMode.light);

      cubit.setThemeMode(ThemeMode.dark);
      expect(cubit.state.themeMode, ThemeMode.dark);
    });

    test('fromJson should deserialize correctly', () {
      expect(
        cubit.fromJson({'themeMode': 'light'})?.themeMode,
        ThemeMode.light,
      );
      expect(cubit.fromJson({'themeMode': 'dark'})?.themeMode, ThemeMode.dark);
      expect(
        cubit.fromJson({'themeMode': 'unknown'})?.themeMode,
        ThemeMode.dark,
      );
      expect(cubit.fromJson({})?.themeMode, ThemeMode.dark);
    });

    test('toJson should serialize correctly', () {
      expect(cubit.toJson(const ThemeState(themeMode: ThemeMode.light)), {
        'themeMode': 'light',
      });
      expect(cubit.toJson(const ThemeState(themeMode: ThemeMode.dark)), {
        'themeMode': 'dark',
      });
      expect(cubit.toJson(const ThemeState(themeMode: ThemeMode.system)), {
        'themeMode': 'dark',
      });
    });
  });
}
