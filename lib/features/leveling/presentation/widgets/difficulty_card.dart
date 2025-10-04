import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/leveling/data/constants/difficulties.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz/quiz_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_master/utils/extensions.dart';
import 'package:quiz_master/utils/helpers.dart';

class DifficultyCard extends StatefulWidget {
  final Difficulties difficulty;
  final Color iconColor;
  final Duration delay;
  final int? category;

  const DifficultyCard({
    super.key,
    required this.difficulty,
    required this.delay,
    required this.iconColor,
    this.category,
  });

  @override
  State<DifficultyCard> createState() => _DifficultyCardState();
}

class _DifficultyCardState extends State<DifficultyCard>
    with SingleTickerProviderStateMixin {
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
                  builder: (_) => BlocProvider(
                    create: (_) => sl<QuizCubit>()
                      ..loadQuiz(
                        QuizParams(
                          amount: widget.difficulty.questionCount,
                          category: widget.category,
                          difficulty: widget.difficulty.apiValue,
                        ),
                      ),
                    child: QuizPage(difficulty: widget.difficulty),
                  ),
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
                  side: BorderSide(
                    color: _hovering || _pressed
                        ? Colors.deepPurpleAccent
                        : Colors.grey.shade500,
                    width: 0.5,
                  ),
                ),
                elevation: _hovering || _pressed ? 1 : 0,
                color: Helpers.isDarkMode(context)
                    ? Colors.white.withAlpha(10)
                    : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        widget.difficulty.icon,
                        size: 48,
                        color: widget.iconColor,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.difficulty.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${widget.difficulty.multiplier}x XP",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurpleAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.difficulty.description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.center,
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
