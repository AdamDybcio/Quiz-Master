import 'package:quiz_master/features/leveling/data/constants/difficulties.dart';

extension DifficultiesConfigExtension on Difficulties {
  int get questionCount {
    switch (apiValue) {
      case 'easy':
        return 8;
      case 'medium':
        return 10;
      case 'hard':
        return 12;
      default:
        return 10;
    }
  }

  Duration get timePerQuestion {
    switch (apiValue) {
      case 'easy':
        return const Duration(seconds: 20);
      case 'medium':
        return const Duration(seconds: 15);
      case 'hard':
        return const Duration(seconds: 10);
      default:
        return const Duration(seconds: 15);
    }
  }

  double get scoreMultiplier => multiplier;
}
