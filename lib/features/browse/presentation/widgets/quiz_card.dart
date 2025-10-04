import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/features/browse/data/model/quiz.dart';
import 'package:quiz_master/features/leveling/presentation/pages/leveling_difficulty_page.dart';

class QuizCard extends StatefulWidget {
  final Quiz quiz;
  final Duration delay;

  const QuizCard({super.key, required this.quiz, required this.delay});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  bool _pressed = false;
  bool _hovering = false;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  void _handleTapDown(TapDownDetails _) => setState(() => _pressed = true);
  void _handleTapUp(TapUpDetails _) => Future.delayed(
    const Duration(milliseconds: 100),
    () => mounted ? setState(() => _pressed = false) : null,
  );
  void _handleTapCancel() => setState(() => _pressed = false);

  double get _scale {
    double s = 1.0;
    if (_hovering) s *= 1.05;
    if (_pressed) s *= 0.92;
    return s;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedSlide(
      offset: _visible ? Offset.zero : const Offset(0, 0.2),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        child: MouseRegion(
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
                      LevelingDifficultyPage(category: widget.quiz.category),
                ),
              );
            },
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _hovering || _pressed
                        ? Colors.deepPurpleAccent
                        : Colors.grey.shade500,
                    width: 0.5,
                  ),
                ),
                elevation: _hovering || _pressed ? 2 : 0,
                color: isDark ? Colors.white.withAlpha(10) : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaIcon(
                        widget.quiz.icon,
                        color: Colors.purpleAccent,
                        size: 28,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.quiz.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.quiz.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
