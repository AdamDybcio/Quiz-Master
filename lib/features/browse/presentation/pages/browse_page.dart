import 'package:flutter/material.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/core/presentation/widgets/theme_toggle_button.dart';
import 'package:quiz_master/features/browse/presentation/widgets/browse_content.dart';
import 'package:quiz_master/features/browse/presentation/widgets/quiz_grid.dart';
import 'package:quiz_master/features/leveling/presentation/widgets/level_card.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        animateColor: true,
        title: Padding(
          padding: EdgeInsets.only(
            left: Responsive.isMobile(context)
                ? 0
                : Responsive.isTablet(context)
                ? 16
                : MediaQuery.of(context).size.width * 0.15,
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFF6EC7), Color(0xFF9B59B6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.only(
          right: Responsive.isMobile(context)
              ? 0
              : Responsive.isTablet(context)
              ? 16
              : MediaQuery.of(context).size.width * 0.15,
        ),
        actions: [
          ThemeToggleButton(),
          SizedBox(
            width: Responsive.isMobile(context)
                ? 6
                : Responsive.isTablet(context)
                ? 8
                : 16,
          ),
          LevelCard(),
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: Helpers.isDarkMode(context)
                ? const LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF2E1A3F)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 900),
                    child: BrowseContent(),
                  ),
                  SizedBox(height: 48),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1200),
                    child: Responsive(
                      mobile: QuizGrid(columns: 1),
                      tablet: QuizGrid(columns: 2),
                      desktop: QuizGrid(columns: 3),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
