import 'package:flutter/material.dart';
import 'package:quiz_master/features/achievements/data/model/achievement.dart';
import 'package:quiz_master/features/achievements/presentation/widgets/achievement_card.dart';
import 'package:quiz_master/utils/enums.dart';

class AchievementsGrid extends StatelessWidget {
  final int columns;
  final List<Achievement> unlocked;
  const AchievementsGrid({
    super.key,
    required this.columns,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    final achievementCategories = AchievementCategory.values.toList();
    final unlockedLevelsPerCategory = {
      for (var category in achievementCategories)
        category: unlocked
            .where((a) => a.category == category)
            .map((a) => a.level)
            .toSet(),
    };
    final sortedCategories = achievementCategories
      ..sort((a, b) {
        final aUnlocked = unlockedLevelsPerCategory[a]?.isNotEmpty ?? false;
        final bUnlocked = unlockedLevelsPerCategory[b]?.isNotEmpty ?? false;
        if (aUnlocked && !bUnlocked) return -1;
        if (!aUnlocked && bUnlocked) return 1;
        return a.index.compareTo(b.index);
      });
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalSpacing = (columns - 1) * 16;
        final itemWidth = (constraints.maxWidth - totalSpacing) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(achievementCategories.length, (index) {
            final delay = Duration(milliseconds: 100 * index);
            final category = sortedCategories[index];
            final unlockedLevels = unlockedLevelsPerCategory[category] ?? {};
            return SizedBox(
              width: itemWidth,
              child: AchievementCard(
                category: category,
                unlockedLevels: unlockedLevels,
                delay: delay,
              ),
            );
          }),
        );
      },
    );
  }
}
