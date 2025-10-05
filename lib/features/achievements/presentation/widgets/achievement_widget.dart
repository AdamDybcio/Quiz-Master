import 'package:flutter/material.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/features/achievements/data/model/achievement.dart';
import 'package:quiz_master/utils/enums.dart';

class AchievementWidget extends StatefulWidget {
  final Achievement achievement;
  final VoidCallback onDismiss;

  const AchievementWidget({
    super.key,
    required this.achievement,
    required this.onDismiss,
  });

  @override
  State<AchievementWidget> createState() => AchievementWidgetState();
}

class AchievementWidgetState extends State<AchievementWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnim = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      _controller.reverse().then((_) => widget.onDismiss());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final width = isMobile ? 250.0 : 350.0;

    final levelStyles = {
      AchievementLevel.bronze: _LevelStyle(
        gradient: [Colors.brown.shade700, Colors.brown.shade400],
        border: Colors.orange.shade200,
        iconColor: Colors.orange.shade300,
        glow: Colors.orange.withAlpha(75),
      ),
      AchievementLevel.silver: _LevelStyle(
        gradient: [Colors.grey.shade800, Colors.grey.shade500],
        border: Colors.white54,
        iconColor: Colors.white70,
        glow: Colors.white.withAlpha(75),
      ),
      AchievementLevel.gold: _LevelStyle(
        gradient: [Color(0xFFB8860B), Color(0xFFFFD700)],
        border: Color(0xFFE0C068),
        iconColor: Color(0xFFFFE29A),
        glow: Color(0x33FFD700),
      ),
      AchievementLevel.platinum: _LevelStyle(
        gradient: [Colors.blueGrey.shade800, Colors.blueGrey.shade500],
        border: Colors.cyanAccent,
        iconColor: Colors.cyanAccent.shade100,
        glow: Colors.cyanAccent.withAlpha(100),
      ),
      AchievementLevel.diamond: _LevelStyle(
        gradient: [Color(0xFF00BCD4), Color(0xFF008BA3)],
        border: Color(0xFFB2EBF2),
        iconColor: Colors.white70,
        glow: Color(0x2200BCD4),
        shine: true,
      ),
      AchievementLevel.master: _LevelStyle(
        gradient: [Color(0xFF5D3A7D), Color(0xFF3F1E5C)],
        border: Color(0xFFBB86FC),
        iconColor: Color(0xFFD1B3FF),
        glow: Color(0x33BB86FC),
        shine: true,
      ),
    };

    final style = levelStyles[widget.achievement.level]!;

    return SlideTransition(
      position: _offsetAnim,
      child: Stack(
        children: [
          if (style.shine)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  final shimmerPosition = (_controller.value * 2 - 1).clamp(
                    0.0,
                    1.0,
                  );
                  return ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        colors: [
                          Colors.white.withAlpha(0),
                          Colors.white.withAlpha(90),
                          Colors.white.withAlpha(0),
                        ],
                        stops: [
                          shimmerPosition - 0.3,
                          shimmerPosition,
                          shimmerPosition + 0.3,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: style.gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            child: Container(
              width: width,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: style.gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: style.glow,
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(color: style.border, width: 1.8),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: style.border, width: 2),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withAlpha(50),
                          Colors.white.withAlpha(8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      widget.achievement.icon,
                      color: style.iconColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.achievement.title.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            letterSpacing: 1,
                            shadows: [
                              Shadow(blurRadius: 6, color: Colors.black54),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.achievement.description,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelStyle {
  final List<Color> gradient;
  final Color border;
  final Color iconColor;
  final Color glow;
  final bool shine;

  _LevelStyle({
    required this.gradient,
    required this.border,
    required this.iconColor,
    required this.glow,
    this.shine = false,
  });
}
