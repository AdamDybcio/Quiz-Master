import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/blocs/theme_cubit.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/di.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    double iconSize = Responsive.isMobile(context)
        ? 20
        : Responsive.isTablet(context)
        ? 24
        : 28;

    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: sl<ThemeCubit>(),
      builder: (context, state) {
        return IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            sl<ThemeCubit>().setThemeMode(
              state.themeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final fade = FadeTransition(opacity: animation, child: child);
              final scale = ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1).animate(animation),
                child: fade,
              );
              final rotation = RotationTransition(
                turns: Tween<double>(begin: 0.25, end: 0).animate(animation),
                child: scale,
              );
              return rotation;
            },
            child: Material(
              key: ValueKey(state.themeMode),
              color: Colors.transparent,
              child: FaIcon(
                state.themeMode == ThemeMode.dark
                    ? FontAwesomeIcons.solidMoon
                    : FontAwesomeIcons.solidSun,
                color: state.themeMode == ThemeMode.dark
                    ? Colors.white
                    : Colors.deepPurpleAccent,
                size: iconSize,
              ),
            ),
          ),
        );
      },
    );
  }
}
