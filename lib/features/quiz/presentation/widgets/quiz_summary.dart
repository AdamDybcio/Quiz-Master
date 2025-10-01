import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz/quiz_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/home_button.dart'
    show HomeButton;
import 'package:quiz_master/features/quiz/presentation/widgets/quiz_answer_review.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/quiz_summary_stats.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class QuizSummary extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final Duration totalTime;
  final List<int> answerTimes;
  final List<Question> questions;
  final List<String?> userAnswers;

  const QuizSummary({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.totalTime,
    required this.answerTimes,
    required this.questions,
    required this.userAnswers,
  });

  @override
  State<QuizSummary> createState() => _QuizSummaryState();
}

class _QuizSummaryState extends State<QuizSummary>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double percentage = widget.totalQuestions > 0
        ? widget.score / widget.totalQuestions
        : 0;

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            _buildAnimatedCard(context, percentage),
            const SizedBox(height: 24),
            QuizSummaryStats(
              score: widget.score,
              totalQuestions: widget.totalQuestions,
              totalTime: widget.totalTime,
              answerTimes: widget.answerTimes,
            ),
            const SizedBox(height: 24),
            QuizAnswerReview(
              questions: widget.questions,
              userAnswers: widget.userAnswers,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const FaIcon(FontAwesomeIcons.rotateLeft),
                  label: Text(
                    AppLocalizations.of(context)!.playAgain,
                    style: const TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) =>
                              sl<QuizCubit>()..loadQuiz(QuizParams(amount: 10)),
                          child: QuizPage(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                HomeButton(),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedCard(BuildContext context, double percentage) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(70),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(
                FontAwesomeIcons.trophy,
                color: Colors.white,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                "${AppLocalizations.of(context)!.keepPracticing} 💪",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                "${widget.score}/${widget.totalQuestions}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LinearProgressIndicator(
                  value: percentage,
                  minHeight: 16,
                  backgroundColor: Colors.white.withAlpha(75),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "${(percentage * 100).round()}% ${AppLocalizations.of(context)!.correct}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
