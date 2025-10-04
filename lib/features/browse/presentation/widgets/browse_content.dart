import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/features/browse/presentation/blocs/browse/browse_bloc.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/helpers.dart';

class BrowseContent extends StatefulWidget {
  const BrowseContent({super.key});

  @override
  State<BrowseContent> createState() => _BrowseContentState();
}

class _BrowseContentState extends State<BrowseContent>
    with TickerProviderStateMixin {
  late final AnimationController _textController;
  late final AnimationController _searchController;
  late final Animation<double> _textOpacity;
  late final Animation<double> _searchOpacity;
  late final Animation<Offset> _textOffset;
  late final Animation<Offset> _searchOffset;

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchControllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    sl<BrowseBloc>().add(BrowseLoad(context));

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _searchController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _textOpacity = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    );
    _textOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );

    _searchOpacity = CurvedAnimation(
      parent: _searchController,
      curve: Curves.easeOut,
    );
    _searchOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _searchController,
            curve: Curves.easeOutCubic,
          ),
        );

    _textController.forward().then((_) => _searchController.forward());
  }

  @override
  void dispose() {
    _textController.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    _searchControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final greyColor = Helpers.isDarkMode(context)
        ? Colors.grey[400]
        : Colors.grey[600];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _textOffset,
          child: FadeTransition(
            opacity: _textOpacity,
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) =>
                      const LinearGradient(
                        colors: [Color(0xFFFF6EC7), Color(0xFF9B59B6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: Text(
                    AppLocalizations.of(context)!.browseTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.browseSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: greyColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        SlideTransition(
          position: _searchOffset,
          child: FadeTransition(
            opacity: _searchOpacity,
            child: Focus(
              onFocusChange: (_) => setState(() {}),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _focusNode.hasFocus
                        ? const Color(0xFF9B59B6)
                        : Colors.grey.shade400,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  focusNode: _focusNode,
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  controller: _searchControllerText,
                  onChanged: (value) {
                    sl<BrowseBloc>().add(BrowseQueryChanged(value));
                    setState(() {});
                  },
                  style: TextStyle(
                    color: Helpers.isDarkMode(context)
                        ? Colors.white
                        : Colors.black87,
                  ),
                  decoration: InputDecoration(
                    icon: _searchControllerText.text.isNotEmpty
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            onPressed: () {
                              _searchControllerText.clear();
                              sl<BrowseBloc>().add(BrowseReset());
                              setState(() {});
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.xmark,
                              size: 18,
                              color: Colors.purpleAccent,
                            ),
                          )
                        : const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.purpleAccent,
                          ),
                    hintText: AppLocalizations.of(context)!.browseHint,
                    hintStyle: TextStyle(color: greyColor),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
