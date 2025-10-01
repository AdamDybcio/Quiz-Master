import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/utils/helpers.dart';

class HoverChip extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool enabled;

  const HoverChip({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.enabled = true,
  });

  @override
  State<HoverChip> createState() => HoverChipState();
}

class HoverChipState extends State<HoverChip> {
  bool _hovering = false;

  void _setHovering(bool hovering) {
    if (!widget.enabled) return;
    setState(() => _hovering = hovering);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = !widget.enabled
        ? null
        : _hovering
        ? Helpers.isDarkMode(context)
              ? Colors.teal
              : Colors.teal.shade300
        : Helpers.isDarkMode(context)
        ? Colors.black.withAlpha(150)
        : Colors.white;

    return MouseRegion(
      onEnter: (_) => _setHovering(true),
      onExit: (_) => _setHovering(false),
      child: GestureDetector(
        onTapDown: (_) => _setHovering(true),
        onTapUp: (_) => _setHovering(false),
        onTapCancel: () => _setHovering(false),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.enabled ? widget.onTap : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: widget.enabled
                      ? Colors.grey.shade500
                      : Colors.grey.shade400,
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    widget.icon,
                    color: widget.enabled
                        ? (Helpers.isDarkMode(context)
                              ? Colors.white
                              : Colors.deepPurpleAccent)
                        : Colors.grey.shade500,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.enabled
                          ? (Helpers.isDarkMode(context)
                                ? Colors.white
                                : Colors.black)
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
