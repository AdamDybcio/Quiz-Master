import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/achievements/data/constants/achievements_list.dart';
import 'package:quiz_master/features/achievements/presentation/blocs/achievements_bloc.dart';
import 'package:quiz_master/features/achievements/presentation/widgets/achievements_grid.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class AchievementsContent extends StatefulWidget {
  const AchievementsContent({super.key});

  @override
  State<AchievementsContent> createState() => _AchievementsContentState();
}

class _AchievementsContentState extends State<AchievementsContent>
    with TickerProviderStateMixin {
  late final AnimationController _headerController;
  late final AnimationController _cardController;
  late final Animation<double> _headerOpacity;
  late final Animation<double> _cardOpacity;
  late final Animation<Offset> _headerOffset;
  late final Animation<Offset> _cardOffset;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _headerOpacity = CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeOut,
    );
    _headerOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _headerController,
            curve: Curves.easeOutCubic,
          ),
        );

    _cardOpacity = CurvedAnimation(
      parent: _cardController,
      curve: Curves.easeOut,
    );
    _cardOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _cardController, curve: Curves.easeOutCubic),
        );

    _headerController.forward().then((_) => _cardController.forward());
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final greyColor = Helpers.isDarkMode(context)
        ? Colors.grey[400]
        : Colors.grey[600];

    final achievements = getAchievements(context);
    final unlocked = achievements
        .where(
          (a) =>
              ((sl<AchievementsBloc>()
                      .state
                      .unlockedLevels[a.category]
                      ?.index ??
                  -1) >=
              a.level.index),
        )
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SlideTransition(
            position: _headerOffset,
            child: FadeTransition(
              opacity: _headerOpacity,
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFF6EC7), Color(0xFF9B59B6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                    child: Text(
                      AppLocalizations.of(context)!.achievements,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.trackProgress,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: greyColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SlideTransition(
            position: _cardOffset,
            child: FadeTransition(
              opacity: _cardOpacity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.deepPurpleAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.medal,
                        color: Colors.white,
                        size: 48,
                      ),
                      const SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.unlocked,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${unlocked.length} / ${achievements.length}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Responsive(
            mobile: AchievementsGrid(columns: 1, unlocked: unlocked),
            tablet: AchievementsGrid(columns: 2, unlocked: unlocked),
            desktop: AchievementsGrid(columns: 2, unlocked: unlocked),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
