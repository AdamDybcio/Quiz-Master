import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_master/features/leveling/presentation/blocs/user_level/user_level_bloc.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserLevelBloc bloc;
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    HydratedBloc.storage = storage;

    bloc = UserLevelBloc(baseXp: 100, exponent: 1.0);
  });

  group('UserLevelBloc Tests', () {
    test('initial state is level 1, xp 0', () {
      expect(bloc.state.level, 1);
      expect(bloc.state.currentXp, 0);
    });

    test('AddXp increases XP correctly without leveling up', () async {
      bloc.add(const AddXp(50));

      await expectLater(
        bloc.stream,
        emits(bloc.state.copyWith(level: 1, currentXp: 50)),
      );
    });

    test('AddXp levels up when XP exceeds threshold', () async {
      bloc.add(const AddXp(150));

      await expectLater(
        bloc.stream,
        emits(bloc.state.copyWith(level: 2, currentXp: 50)),
      );
    });

    test('AddXp handles multiple level-ups', () async {
      bloc.add(const AddXp(250));
      await expectLater(
        bloc.stream,
        emits(bloc.state.copyWith(level: 2, currentXp: 150)),
      );
    });

    test('ResetLevel resets level and XP', () async {
      bloc.add(const AddXp(120));
      bloc.add(ResetLevel());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          bloc.state.copyWith(level: 2, currentXp: 20),
          const UserLevelState(level: 1, currentXp: 0),
        ]),
      );
    });

    test('fromJson and toJson work correctly', () {
      final state = UserLevelState(level: 5, currentXp: 42);
      final json = bloc.toJson(state);
      expect(json, {'level': 5, 'currentXp': 42});

      final restored = bloc.fromJson(json!);
      expect(restored!.level, 5);
      expect(restored.currentXp, 42);
    });
  });
}
