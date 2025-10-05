import 'package:flutter/material.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/features/achievements/data/model/achievement.dart';
import 'package:quiz_master/features/achievements/presentation/widgets/achievement_widget.dart';

class AchievementOverlay {
  static final AchievementOverlay _instance = AchievementOverlay._internal();
  factory AchievementOverlay() => _instance;
  AchievementOverlay._internal();

  final List<Achievement> _queue = [];
  OverlayEntry? _currentEntry;

  void show(BuildContext context, {required Achievement achievement}) {
    _queue.add(achievement);
    _showNext(context);
  }

  void _showNext(BuildContext context) {
    if (_currentEntry != null || _queue.isEmpty) return;

    final achievement = _queue.removeAt(0);

    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final bottomOffset = isMobile ? 90.0 : 20.0;
    final rightOffset = isMobile
        ? 10.0
        : isTablet
        ? 30.0
        : 40.0;

    _currentEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: bottomOffset,
          right: rightOffset,
          left: isMobile ? 10.0 : null,
          child: SafeArea(
            child: Align(
              alignment: isMobile
                  ? Alignment.bottomCenter
                  : Alignment.bottomRight,
              child: AchievementWidget(
                achievement: achievement,
                onDismiss: () {
                  _currentEntry?.remove();
                  _currentEntry = null;
                  _showNext(context);
                },
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_currentEntry!);
  }
}
