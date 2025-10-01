import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_state.dart';

import '../widgets/quiz_summary.dart';

class QuizRunPage extends StatelessWidget {
  const QuizRunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizRunCubit, QuizRunState>(
      builder: (context, state) {
        if (state.showResults) {
          return QuizSummary(
            score: state.score,
            totalQuestions: state.questions.length,
          );
        }

        final question = state.questions[state.currentIndex];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Czas: ${state.timeLeft} sek"),
            Text("Pytanie ${state.currentIndex + 1}/${state.questions.length}"),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(question.question),
            ),
            ...question.shuffledAnswers.map(
              (a) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ElevatedButton(
                  onPressed: state.disabledAnswers.contains(a)
                      ? null
                      : () => context.read<QuizRunCubit>().answer(a),
                  child: Text(a),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.lifelineFiftyFiftyAvailable)
                  IconButton(
                    icon: const Icon(Icons.percent),
                    onPressed: () =>
                        context.read<QuizRunCubit>().useFiftyFifty(),
                  ),
                if (state.lifelineSkipAvailable)
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () => context.read<QuizRunCubit>().useSkip(),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
