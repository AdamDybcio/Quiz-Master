import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/leveling/presentation/blocs/user_level/user_level_bloc.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLevelBloc, UserLevelState>(
      bloc: sl<UserLevelBloc>(),
      builder: (context, state) {
        final xpToNext = sl<UserLevelBloc>().xpToNextLevel(state.level);
        final progress = (state.currentXp / xpToNext).clamp(0.0, 1.0);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          margin: const EdgeInsets.only(right: 8),
          constraints: const BoxConstraints(maxHeight: kToolbarHeight),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.trophy,
                    color: Colors.amber,
                    size: 24,
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.orange,
                        size: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 6),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.level,
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${state.level}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${state.currentXp} XP',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      const Text('/', style: TextStyle(fontSize: 10)),
                      const SizedBox(width: 4),
                      Text('$xpToNext XP', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: 60,
                    height: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
