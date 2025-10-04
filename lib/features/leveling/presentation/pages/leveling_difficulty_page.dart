import 'package:flutter/material.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/features/leveling/data/constants/difficulties.dart';
import 'package:quiz_master/features/leveling/presentation/widgets/difficulty_card.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/home_button.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class LevelingDifficultyPage extends StatelessWidget {
  final int? category;
  const LevelingDifficultyPage({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final List<Difficulties> difficulties = getDifficulties(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Helpers.isDarkMode(context)
              ? const LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF2E1A3F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.chooseYourDifficulty,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Text(
                      AppLocalizations.of(context)!.chooseYourDifficultyDesc,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Responsive(
                      mobile: _buildGrid(context, 1, difficulties, category),
                      tablet: _buildGrid(context, 3, difficulties, category),
                      desktop: _buildGrid(context, 3, difficulties, category),
                    ),
                  ),
                  const SizedBox(height: 24),
                  HomeButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    int columns,
    List<Difficulties> difficulties,
    int? category,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalSpacing = (columns - 1) * 16;
        final itemWidth = (constraints.maxWidth - totalSpacing) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(difficulties.length, (index) {
            final delay = Duration(milliseconds: 150 * index);
            return SizedBox(
              width: itemWidth,
              child: DifficultyCard(
                difficulty: difficulties[index],
                delay: delay,
                category: category,
                iconColor: index == 0
                    ? Colors.green
                    : index == 1
                    ? Colors.yellow
                    : Colors.red,
              ),
            );
          }),
        );
      },
    );
  }
}
