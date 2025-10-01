import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz/quiz_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/pages/quiz_run_page.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: Helpers.isDarkMode(context)
                ? const LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF2E1A3F)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
          ),
          child: BlocBuilder<QuizCubit, QuizState>(
            builder: (context, state) {
              if (state is QuizInitial || state is QuizLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                );
              } else if (state is QuizLoaded) {
                return BlocProvider(
                  create: (_) => QuizRunCubit(state.questions),
                  child: QuizRunPage(),
                );
              } else if (state is QuizError) {
                return Center(
                  child: Text(
                    "${AppLocalizations.of(context)!.error}: ${state.message}",
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
