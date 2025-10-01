import 'package:flutter/material.dart';
import 'package:quiz_master/utils/helpers.dart';

class AnswerCard extends StatefulWidget {
  final String answer;
  final String label;
  final bool disabled;
  final VoidCallback? onTap;

  const AnswerCard({
    super.key,
    required this.answer,
    required this.label,
    this.disabled = false,
    this.onTap,
  });

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  bool _hovering = false;

  void _setHover(bool hover) {
    if (!widget.disabled) {
      setState(() => _hovering = hover);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.disabled
        ? null
        : _hovering
        ? Helpers.isDarkMode(context)
              ? Colors.teal
              : Colors.teal.shade300
        : Helpers.isDarkMode(context)
        ? Colors.black.withAlpha(150)
        : Colors.white;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTapDown: (_) => _setHover(true),
        onTapUp: (_) => _setHover(false),
        onTapCancel: () => _setHover(false),
        onTap: widget.disabled ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.disabled
                  ? Colors.grey.shade400
                  : Colors.grey.shade500,
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.disabled
                      ? Colors.grey.shade500
                      : Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.answer,
                  style: TextStyle(
                    color: widget.disabled
                        ? Colors.grey.shade500
                        : Helpers.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
