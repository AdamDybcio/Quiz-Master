import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/features/leveling/data/constants/difficulties.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_state.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/animated_answer_card.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/hover_chip.dart';
import 'package:quiz_master/features/quiz/presentation/widgets/question_card_wrapper.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/extensions.dart';

import '../widgets/quiz_summary.dart';

class QuizRunPage extends StatelessWidget {
  final Difficulties difficulty;
  const QuizRunPage({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizRunCubit, QuizRunState>(
      builder: (context, state) {
        if (state.showResults) {
          return QuizSummary(
            score: state.score,
            totalQuestions: state.questions.length,
            totalTime: state.totalElapsedTime,
            answerTimes: state.answerTimes,
            questions: state.questions,
            userAnswers: state.userAnswers,
          );
        }

        final question = state.questions[state.currentIndex];
        final totalQuestions = state.questions.length;
        final currentQuestion = state.currentIndex + 1;

        final questionProgress = currentQuestion / totalQuestions;
        final timeProgress =
            state.timeLeft / difficulty.timePerQuestion.inSeconds;

        return SafeArea(
          child: SizedBox.expand(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.question} $currentQuestion ${AppLocalizations.of(context)!.questionOf} $totalQuestions",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.clock,
                                color: Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${state.timeLeft}s",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: questionProgress),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: 10,
                            backgroundColor: Colors.tealAccent,
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(6),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: timeProgress),
                        duration: const Duration(milliseconds: 500),
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: 6,
                            backgroundColor: Colors.tealAccent,
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(6),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HoverChip(
                            icon: FontAwesomeIcons.bolt,
                            label: "50/50",
                            enabled: state.lifelineFiftyFiftyAvailable,
                            onTap: state.lifelineFiftyFiftyAvailable
                                ? () => context
                                      .read<QuizRunCubit>()
                                      .useFiftyFifty()
                                : null,
                          ),
                          const SizedBox(width: 16),
                          HoverChip(
                            icon: FontAwesomeIcons.forwardStep,
                            label: AppLocalizations.of(context)!.skip,
                            enabled: state.lifelineSkipAvailable,
                            onTap: state.lifelineSkipAvailable
                                ? () => context.read<QuizRunCubit>().useSkip()
                                : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: QuestionCardWrapper(
                        key: ValueKey(state.currentIndex),
                        question: question.question,
                        exitDuration: const Duration(milliseconds: 500),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Column(
                        children: List.generate(
                          question.shuffledAnswers.length,
                          (index) {
                            final answer = question.shuffledAnswers[index];
                            final label = '${String.fromCharCode(65 + index)}.';

                            return AnimatedAnswerCard(
                              key: ValueKey('${state.currentIndex}_$answer'),
                              index: index,
                              label: label,
                              answer: answer,
                              disabled: state.disabledAnswers.contains(answer),
                              onTap: () =>
                                  context.read<QuizRunCubit>().answer(answer),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
