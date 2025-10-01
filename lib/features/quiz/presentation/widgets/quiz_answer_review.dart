import 'package:flutter/material.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class QuizAnswerReview extends StatelessWidget {
  final List<Question> questions;
  final List<String?> userAnswers;

  QuizAnswerReview({
    super.key,
    required this.questions,
    required this.userAnswers,
  });

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900, maxHeight: 500),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Helpers.isDarkMode(context)
              ? Colors.grey.shade900
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Helpers.isDarkMode(context)
                ? Colors.grey.shade800
                : Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.answerReview,
              style: TextStyle(
                color: Helpers.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                child: ListView.builder(
                  itemCount: questions.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final userAnswer = userAnswers.isEmpty
                        ? null
                        : userAnswers[index];
                    final correctAnswer = question.correctAnswer;
                    final isCorrect = userAnswer == correctAnswer;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isCorrect ? Colors.green : Colors.red,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isCorrect
                            ? const Color.fromARGB(
                                255,
                                46,
                                112,
                                48,
                              ).withAlpha(25)
                            : const Color.fromARGB(
                                255,
                                156,
                                43,
                                35,
                              ).withAlpha(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}. ${question.question}",
                            style: TextStyle(
                              color: Helpers.isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (isCorrect) ...[
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.yourAnswer}:",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    userAnswer ??
                                        AppLocalizations.of(context)!.noAnswer,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.yourAnswer}:",
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    userAnswer ??
                                        AppLocalizations.of(context)!.noAnswer,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.correctAnswer}:",
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    correctAnswer,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
