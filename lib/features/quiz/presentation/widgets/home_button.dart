import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({super.key});

  @override
  State<HomeButton> createState() => HomeButtonState();
}

class HomeButtonState extends State<HomeButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 0.5, color: Colors.grey.shade500),
          backgroundColor: isHovered
              ? Colors.teal
              : Helpers.isDarkMode(context)
              ? Colors.black.withAlpha(150)
              : Colors.white,
          foregroundColor: Helpers.isDarkMode(context)
              ? Colors.white
              : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const FaIcon(FontAwesomeIcons.house),
        label: Text(
          AppLocalizations.of(context)!.home,
          style: const TextStyle(fontSize: 14),
        ),
        onPressed: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
    );
  }
}
