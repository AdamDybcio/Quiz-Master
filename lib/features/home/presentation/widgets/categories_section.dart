import 'package:flutter/material.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/features/leveling/presentation/pages/leveling_difficulty_page.dart';
import 'package:quiz_master/features/quiz/data/constants/categories.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<QuizCategory> categories = getCategories(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  AppLocalizations.of(context)!.chooseYourCategory,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  AppLocalizations.of(context)!.chooseYourCategoryDesc,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Responsive(
              mobile: _buildGrid(context, 2, categories),
              tablet: _buildGrid(context, 4, categories),
              desktop: _buildGrid(context, 4, categories),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    int columns,
    List<QuizCategory> categories,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalSpacing = (columns - 1) * 16;
        final itemWidth = (constraints.maxWidth - totalSpacing) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(categories.length, (index) {
            final delay = Duration(milliseconds: 150 * index);
            return SizedBox(
              width: itemWidth,
              child: _AnimatedCategoryCard(
                category: categories[index],
                delay: delay,
              ),
            );
          }),
        );
      },
    );
  }
}

class _AnimatedCategoryCard extends StatefulWidget {
  final QuizCategory category;
  final Duration delay;

  const _AnimatedCategoryCard({required this.category, required this.delay});

  @override
  State<_AnimatedCategoryCard> createState() => _AnimatedCategoryCardState();
}

class _AnimatedCategoryCardState extends State<_AnimatedCategoryCard>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;
  bool _hovering = false;

  void _handleTapDown(TapDownDetails _) {
    setState(() => _pressed = true);
  }

  void _handleTapUp(TapUpDetails _) {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _pressed = false);
    });
  }

  void _handleTapCancel() {
    setState(() => _pressed = false);
  }

  double get _scale {
    double scale = 1.0;
    if (_hovering) scale *= 1.1;
    if (_pressed) scale *= 0.9;
    return scale;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  LevelingDifficultyPage(category: widget.category.id),
            ),
          );
        },
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            elevation: _hovering || _pressed ? 1 : 0,
            shadowColor: Colors.deepPurpleAccent.withAlpha(100),
            color: Helpers.isDarkMode(context)
                ? Colors.white.withAlpha(20)
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.category.icon, style: TextStyle(fontSize: 32)),
                  const SizedBox(height: 12),
                  Text(
                    widget.category.name,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
