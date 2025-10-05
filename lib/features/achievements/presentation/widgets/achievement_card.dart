import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/features/achievements/data/constants/achievements_list.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/enums.dart';
import 'package:quiz_master/utils/helpers.dart';

class AchievementCard extends StatefulWidget {
  final AchievementCategory category;
  final Set<AchievementLevel> unlockedLevels;
  final Duration delay;

  const AchievementCard({
    super.key,
    required this.category,
    required this.unlockedLevels,
    required this.delay,
  });

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  Color _medalColor(AchievementLevel level) {
    switch (level) {
      case AchievementLevel.bronze:
        return Colors.brown;
      case AchievementLevel.silver:
        return Colors.grey;
      case AchievementLevel.gold:
        return Colors.amber.shade700;
      case AchievementLevel.platinum:
        return Colors.blueGrey;
      case AchievementLevel.diamond:
        return Colors.cyan.shade700;
      case AchievementLevel.master:
        return Colors.purple.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final allAchievements =
        getAchievements(
            context,
          ).where((a) => a.category == widget.category).toList()
          ..sort((a, b) => a.level.index.compareTo(b.level.index));

    final achievementsMap = {for (var a in allAchievements) a.level: a};

    AchievementLevel? bestLevel;
    for (var level in AchievementLevel.values.reversed) {
      if (widget.unlockedLevels.contains(level)) {
        bestLevel = level;
        break;
      }
    }

    final String? currentAchievementName =
        bestLevel != null && achievementsMap[bestLevel] != null
        ? achievementsMap[bestLevel]!.title
        : null;

    AchievementLevel? nextLevel;
    for (var level in AchievementLevel.values) {
      if (!widget.unlockedLevels.contains(level)) {
        nextLevel = level;
        break;
      }
    }

    return AnimatedSlide(
      offset: _visible ? Offset.zero : const Offset(0, 0.2),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Helpers.isDarkMode(context)
                ? Colors.grey.shade900
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: bestLevel != null
                    ? _medalColor(bestLevel).withAlpha(100)
                    : Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: bestLevel != null
                  ? _medalColor(bestLevel)
                  : Helpers.isDarkMode(context)
                  ? Colors.white12
                  : Colors.black12,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentAchievementName ??
                    AppLocalizations.of(context)!.notUnlockedYet,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: currentAchievementName != null
                      ? null
                      : Colors.grey.shade500,
                ),
              ),
              if (bestLevel != null) const SizedBox(height: 8),
              if (bestLevel != null)
                Text(
                  achievementsMap[bestLevel]?.description ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: AchievementLevel.values.map((level) {
                  final unlocked = widget.unlockedLevels.contains(level);
                  final isBest = level == bestLevel;

                  return Container(
                    padding: EdgeInsets.all(isBest ? 10 : 6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: unlocked
                          ? LinearGradient(
                              colors: [
                                _medalColor(level).withAlpha(200),
                                _medalColor(level),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: unlocked
                          ? null
                          : Colors.grey.shade400.withAlpha(80),
                      boxShadow: isBest && unlocked
                          ? [
                              BoxShadow(
                                color: _medalColor(level).withAlpha(120),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: FaIcon(
                        unlocked
                            ? FontAwesomeIcons.trophy
                            : FontAwesomeIcons.lock,
                        size: isBest ? 22 : 18,
                        color: unlocked ? Colors.white : Colors.grey.shade500,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              if (nextLevel != null && achievementsMap[nextLevel] != null)
                Text(
                  '${AppLocalizations.of(context)!.nextAchievement}: ${nextLevel.name.toUpperCase()} - ${achievementsMap[nextLevel]!.description}',
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
