import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/core/presentation/widgets/responsive.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class InfoCardsSection extends StatelessWidget {
  const InfoCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_InfoCardData> cards = [
      _InfoCardData(
        icon: FontAwesomeIcons.brain,
        title: '10,000+',
        subtitle: AppLocalizations.of(context)!.questions,
      ),
      _InfoCardData(
        icon: FontAwesomeIcons.trophy,
        title: '20+',
        subtitle: AppLocalizations.of(context)!.categories,
      ),
      _InfoCardData(
        icon: FontAwesomeIcons.bolt,
        title: '5,000+',
        subtitle: AppLocalizations.of(context)!.dailyPlayers,
      ),
      _InfoCardData(
        icon: FontAwesomeIcons.bullseye,
        title: '3',
        subtitle: AppLocalizations.of(context)!.difficultyLevels,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Responsive(
          mobile: _buildGridView(context, 2, cards),
          tablet: _buildWrap(context, 2, cards),
          desktop: _buildWrap(context, 4, cards),
        ),
      ),
    );
  }

  Widget _buildGridView(
    BuildContext context,
    int columns,
    List<_InfoCardData> cards,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final delay = Duration(milliseconds: 200 * index);
        return _AnimatedInfoCard(card: cards[index], delay: delay);
      },
    );
  }

  Widget _buildWrap(
    BuildContext context,
    int columns,
    List<_InfoCardData> cards,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalSpacing = (columns - 1) * 16;
        final cardWidth = (constraints.maxWidth - totalSpacing) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(cards.length, (index) {
            final delay = Duration(milliseconds: 200 * index);
            return SizedBox(
              width: cardWidth,
              child: _AnimatedInfoCard(card: cards[index], delay: delay),
            );
          }),
        );
      },
    );
  }
}

class _AnimatedInfoCard extends StatefulWidget {
  final _InfoCardData card;
  final Duration delay;

  const _AnimatedInfoCard({required this.card, required this.delay});

  @override
  State<_AnimatedInfoCard> createState() => _AnimatedInfoCardState();
}

class _AnimatedInfoCardState extends State<_AnimatedInfoCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Responsive(
          mobile: _buildCard(context, 28, 20, 14, 16),
          tablet: _buildCard(context, 36, 24, 16, 24),
          desktop: _buildCard(context, 36, 24, 16, 24),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    double iconSize,
    double titleSize,
    double subtitleSize,
    double verticalPadding,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      elevation: 0,
      color: Helpers.isDarkMode(context)
          ? Colors.white.withAlpha(8)
          : Colors.white.withAlpha(200),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              widget.card.icon,
              size: iconSize,
              color: Colors.purpleAccent,
            ),
            const SizedBox(height: 12),
            Text(
              widget.card.title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.card.subtitle,
              style: TextStyle(fontSize: subtitleSize, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCardData {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
