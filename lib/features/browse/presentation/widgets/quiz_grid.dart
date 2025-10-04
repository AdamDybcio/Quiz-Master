import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/browse/presentation/blocs/browse/browse_bloc.dart';
import 'package:quiz_master/features/browse/presentation/widgets/quiz_card.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class QuizGrid extends StatelessWidget {
  final int columns;
  const QuizGrid({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseBloc, BrowseState>(
      bloc: sl<BrowseBloc>(),
      builder: (context, state) {
        final quizzes = state.filteredQuizzes;

        if (quizzes.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.browseNoCoursesFound,
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final totalSpacing = (columns - 1) * 16;
            final itemWidth = (constraints.maxWidth - totalSpacing) / columns;

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(quizzes.length, (index) {
                final delay = Duration(milliseconds: 100 * index);
                return SizedBox(
                  width: itemWidth,
                  child: QuizCard(quiz: quizzes[index], delay: delay),
                );
              }),
            );
          },
        );
      },
    );
  }
}
