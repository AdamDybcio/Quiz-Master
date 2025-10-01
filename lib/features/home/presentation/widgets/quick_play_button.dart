import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz/quiz_cubit.dart';
import 'package:quiz_master/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class QuickPlayButton extends StatefulWidget {
  const QuickPlayButton({super.key});

  @override
  State<QuickPlayButton> createState() => _QuickPlayButtonState();
}

class _QuickPlayButtonState extends State<QuickPlayButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _glowController;
  late final Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 5, end: 15).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildButton(context, 16, 48, double.infinity),
      tablet: _buildButton(context, 24, 64, 300),
      desktop: _buildButton(context, 32, 80, 400),
    );
  }

  Widget _buildButton(
    BuildContext context,
    double padding,
    double height,
    double maxWidth,
  ) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: const Offset(0, 0.2), end: Offset.zero),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(0, offset.dy * 50),
          child: child,
        );
      },
      child: AnimatedBuilder(
        animation: _glowAnimation,
        builder: (context, child) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withAlpha(125),
                    blurRadius: _glowAnimation.value,
                    spreadRadius: _glowAnimation.value / 2,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
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
                icon: const FaIcon(FontAwesomeIcons.bolt, size: 24),
                label: Padding(
                  padding: EdgeInsets.symmetric(vertical: padding),
                  child: Text(
                    AppLocalizations.of(context)!.quickPlay,
                    style: TextStyle(
                      fontSize: height * 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
