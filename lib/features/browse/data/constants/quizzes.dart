import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/features/browse/data/model/quiz.dart';
import 'package:quiz_master/l10n/app_localizations.dart';

class Quizzes {
  List<Quiz> getQuizzes(BuildContext context) {
    return [
      Quiz(
        id: 1,
        title: AppLocalizations.of(context)!.quizUltimateGeneralKnowledge,
        description: AppLocalizations.of(context)!.descUltimateGeneralKnowledge,
        category: 9,
        icon: FontAwesomeIcons.brain,
      ),
      Quiz(
        id: 2,
        title: AppLocalizations.of(context)!.quizFamousBooksAuthors,
        description: AppLocalizations.of(context)!.descFamousBooksAuthors,
        category: 10,
        icon: FontAwesomeIcons.bookOpen,
      ),
      Quiz(
        id: 3,
        title: AppLocalizations.of(context)!.quizClassicMovieTrivia,
        description: AppLocalizations.of(context)!.descClassicMovieTrivia,
        category: 11,
        icon: FontAwesomeIcons.film,
      ),
      Quiz(
        id: 4,
        title: AppLocalizations.of(context)!.quizMusicLegendsLyrics,
        description: AppLocalizations.of(context)!.descMusicLegendsLyrics,
        category: 12,
        icon: FontAwesomeIcons.music,
      ),
      Quiz(
        id: 5,
        title: AppLocalizations.of(context)!.quizMusicalsTheatresMix,
        description: AppLocalizations.of(context)!.descMusicalsTheatresMix,
        category: 13,
        icon: FontAwesomeIcons.masksTheater,
      ),
      Quiz(
        id: 6,
        title: AppLocalizations.of(context)!.quizTvSeriesCharacters,
        description: AppLocalizations.of(context)!.descTvSeriesCharacters,
        category: 14,
        icon: FontAwesomeIcons.tv,
      ),
      Quiz(
        id: 7,
        title: AppLocalizations.of(context)!.quizVideoGameUniverse,
        description: AppLocalizations.of(context)!.descVideoGameUniverse,
        category: 15,
        icon: FontAwesomeIcons.gamepad,
      ),
      Quiz(
        id: 8,
        title: AppLocalizations.of(context)!.quizBoardGamesChallenge,
        description: AppLocalizations.of(context)!.descBoardGamesChallenge,
        category: 16,
        icon: FontAwesomeIcons.chess,
      ),
      Quiz(
        id: 9,
        title: AppLocalizations.of(context)!.quizScienceNatureInsights,
        description: AppLocalizations.of(context)!.descScienceNatureInsights,
        category: 17,
        icon: FontAwesomeIcons.flask,
      ),
      Quiz(
        id: 10,
        title: AppLocalizations.of(context)!.quizComputerScienceBasics,
        description: AppLocalizations.of(context)!.descComputerScienceBasics,
        category: 18,
        icon: FontAwesomeIcons.laptopCode,
      ),
      Quiz(
        id: 11,
        title: AppLocalizations.of(context)!.quizMathematicalMinds,
        description: AppLocalizations.of(context)!.descMathematicalMinds,
        category: 19,
        icon: FontAwesomeIcons.squareRootVariable,
      ),
      Quiz(
        id: 12,
        title: AppLocalizations.of(context)!.quizGreekNorseMythology,
        description: AppLocalizations.of(context)!.descGreekNorseMythology,
        category: 20,
        icon: FontAwesomeIcons.helmetSafety,
      ),
      Quiz(
        id: 13,
        title: AppLocalizations.of(context)!.quizUltimateSportsTrivia,
        description: AppLocalizations.of(context)!.descUltimateSportsTrivia,
        category: 21,
        icon: FontAwesomeIcons.basketball,
      ),
      Quiz(
        id: 14,
        title: AppLocalizations.of(context)!.quizWorldGeographyExplorer,
        description: AppLocalizations.of(context)!.descWorldGeographyExplorer,
        category: 22,
        icon: FontAwesomeIcons.globe,
      ),
      Quiz(
        id: 15,
        title: AppLocalizations.of(context)!.quizWorldHistoryEssentials,
        description: AppLocalizations.of(context)!.descWorldHistoryEssentials,
        category: 23,
        icon: FontAwesomeIcons.landmark,
      ),
      Quiz(
        id: 16,
        title: AppLocalizations.of(context)!.quizPoliticsWorldLeaders,
        description: AppLocalizations.of(context)!.descPoliticsWorldLeaders,
        category: 24,
        icon: FontAwesomeIcons.scaleBalanced,
      ),
      Quiz(
        id: 17,
        title: AppLocalizations.of(context)!.quizMasterpiecesArt,
        description: AppLocalizations.of(context)!.descMasterpiecesArt,
        category: 25,
        icon: FontAwesomeIcons.palette,
      ),
      Quiz(
        id: 18,
        title: AppLocalizations.of(context)!.quizCelebritiesPopCulture,
        description: AppLocalizations.of(context)!.descCelebritiesPopCulture,
        category: 26,
        icon: FontAwesomeIcons.solidStar,
      ),
      Quiz(
        id: 19,
        title: AppLocalizations.of(context)!.quizAnimalsAroundWorld,
        description: AppLocalizations.of(context)!.descAnimalsAroundWorld,
        category: 27,
        icon: FontAwesomeIcons.paw,
      ),
      Quiz(
        id: 20,
        title: AppLocalizations.of(context)!.quizCarsBikesMachines,
        description: AppLocalizations.of(context)!.descCarsBikesMachines,
        category: 28,
        icon: FontAwesomeIcons.car,
      ),
      Quiz(
        id: 21,
        title: AppLocalizations.of(context)!.quizComicBooksUniverse,
        description: AppLocalizations.of(context)!.descComicBooksUniverse,
        category: 29,
        icon: FontAwesomeIcons.book,
      ),
      Quiz(
        id: 22,
        title: AppLocalizations.of(context)!.quizCoolTechGadgets,
        description: AppLocalizations.of(context)!.descCoolTechGadgets,
        category: 30,
        icon: FontAwesomeIcons.microchip,
      ),
      Quiz(
        id: 23,
        title: AppLocalizations.of(context)!.quizAnimeWorlds,
        description: AppLocalizations.of(context)!.descAnimeWorlds,
        category: 31,
        icon: FontAwesomeIcons.dragon,
      ),
      Quiz(
        id: 24,
        title: AppLocalizations.of(context)!.quizCartoonsAnimations,
        description: AppLocalizations.of(context)!.descCartoonsAnimations,
        category: 32,
        icon: FontAwesomeIcons.film,
      ),
    ];
  }
}
