import 'package:flutter/material.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/question_card.dart';

class QuestionCardWrapper extends StatefulWidget {
  final String question;
  final Duration exitDuration;
  final Duration enterDuration;

  const QuestionCardWrapper({
    super.key,
    required this.question,
    this.exitDuration = const Duration(milliseconds: 500),
    this.enterDuration = const Duration(milliseconds: 500),
  });

  @override
  State<QuestionCardWrapper> createState() => _QuestionCardWrapperState();
}

class _QuestionCardWrapperState extends State<QuestionCardWrapper>
    with TickerProviderStateMixin {
  String? _oldQuestion;
  late AnimationController _enterController;
  late AnimationController _exitController;

  @override
  void initState() {
    super.initState();
    _enterController = AnimationController(
      vsync: this,
      duration: widget.enterDuration,
    );
    _exitController = AnimationController(
      vsync: this,
      duration: widget.exitDuration,
    );

    _enterController.forward();
  }

  @override
  void didUpdateWidget(covariant QuestionCardWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question) {
      _animateChange(oldWidget.question);
    }
  }

  void _animateChange(String oldQuestion) async {
    setState(() {
      _oldQuestion = oldQuestion;
    });

    await _exitController.forward(from: 0);

    setState(() {
      _oldQuestion = null;
    });

    await _enterController.forward(from: 0);
  }

  @override
  void dispose() {
    _enterController.dispose();
    _exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_oldQuestion != null)
          SlideTransition(
            position:
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0, -0.2),
                ).animate(
                  CurvedAnimation(
                    parent: _exitController,
                    curve: Curves.easeIn,
                  ),
                ),
            child: FadeTransition(
              opacity: Tween<double>(begin: 1, end: 0).animate(_exitController),
              child: QuestionCard(
                key: ValueKey(_oldQuestion),
                question: _oldQuestion!,
              ),
            ),
          ),
        SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
              .animate(
                CurvedAnimation(
                  parent: _enterController,
                  curve: Curves.easeOut,
                ),
              ),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(_enterController),
            child: QuestionCard(
              key: ValueKey(widget.question),
              question: widget.question,
            ),
          ),
        ),
      ],
    );
  }
}
