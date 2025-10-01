import 'package:flutter/material.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/answer_card.dart';

class AnimatedAnswerCard extends StatefulWidget {
  final String answer;
  final String label;
  final bool disabled;
  final VoidCallback? onTap;
  final int index;

  const AnimatedAnswerCard({
    super.key,
    required this.answer,
    required this.label,
    this.disabled = false,
    this.onTap,
    required this.index,
  });

  @override
  State<AnimatedAnswerCard> createState() => _AnimatedAnswerCardState();
}

class _AnimatedAnswerCardState extends State<AnimatedAnswerCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slide = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _fade,
        child: AnswerCard(
          label: widget.label,
          answer: widget.answer,
          disabled: widget.disabled,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
