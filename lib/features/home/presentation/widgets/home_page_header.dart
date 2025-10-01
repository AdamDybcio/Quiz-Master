import 'package:flutter/material.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: const Offset(0, -0.2), end: Offset.zero),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(0, offset.dy * 50),
          child: AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 800),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Responsive(
                mobile: _buildTitle(context, 32, 28),
                tablet: _buildTitle(context, 48, 40),
                desktop: _buildTitle(context, 64, 48),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.pageHeaderDesc,
                style: TextStyle(
                  fontSize: width < 600 ? 14 : 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    double titleSize,
    double subtitleSize,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.testKnowledge,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFF6EC7), Color(0xFF9B59B6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Text(
            AppLocalizations.of(context)!.masterTopic,
            style: TextStyle(
              fontSize: subtitleSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
