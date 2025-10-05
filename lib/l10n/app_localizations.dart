import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'QuizMaster'**
  String get appTitle;

  /// No description provided for @testKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Test Your Knowledge,'**
  String get testKnowledge;

  /// No description provided for @masterTopic.
  ///
  /// In en, this message translates to:
  /// **'Master Every Topic'**
  String get masterTopic;

  /// No description provided for @pageHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Challenge yourself with thousands of quiz questions across multiple categories. Track your progress, compete with friends, and become a QuizMaster!'**
  String get pageHeaderDesc;

  /// No description provided for @quickPlay.
  ///
  /// In en, this message translates to:
  /// **'Quick Play'**
  String get quickPlay;

  /// No description provided for @questions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questions;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @dailyPlayers.
  ///
  /// In en, this message translates to:
  /// **'Daily Players'**
  String get dailyPlayers;

  /// No description provided for @difficultyLevels.
  ///
  /// In en, this message translates to:
  /// **'Difficulty Levels'**
  String get difficultyLevels;

  /// No description provided for @categoryScienceAndNature.
  ///
  /// In en, this message translates to:
  /// **'Science & Nature'**
  String get categoryScienceAndNature;

  /// No description provided for @categoryHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get categoryHistory;

  /// No description provided for @categorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categorySports;

  /// No description provided for @categoryGeneralKnowledge.
  ///
  /// In en, this message translates to:
  /// **'General Knowledge'**
  String get categoryGeneralKnowledge;

  /// No description provided for @categoryGeography.
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get categoryGeography;

  /// No description provided for @categoryAnimals.
  ///
  /// In en, this message translates to:
  /// **'Animals'**
  String get categoryAnimals;

  /// No description provided for @categoryComputers.
  ///
  /// In en, this message translates to:
  /// **'Computers'**
  String get categoryComputers;

  /// No description provided for @categoryFilm.
  ///
  /// In en, this message translates to:
  /// **'Film'**
  String get categoryFilm;

  /// No description provided for @chooseYourCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Category'**
  String get chooseYourCategory;

  /// No description provided for @chooseYourCategoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Select a topic and start your quiz journey'**
  String get chooseYourCategoryDesc;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @totalTime.
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get totalTime;

  /// No description provided for @avgTime.
  ///
  /// In en, this message translates to:
  /// **'Avg Time/Question'**
  String get avgTime;

  /// No description provided for @answerReview.
  ///
  /// In en, this message translates to:
  /// **'Answer Review'**
  String get answerReview;

  /// No description provided for @yourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Your answer'**
  String get yourAnswer;

  /// No description provided for @correctAnswer.
  ///
  /// In en, this message translates to:
  /// **'Correct answer'**
  String get correctAnswer;

  /// No description provided for @noAnswer.
  ///
  /// In en, this message translates to:
  /// **'No answer'**
  String get noAnswer;

  /// No description provided for @playAgain.
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @questionOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get questionOf;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyEasyDescription.
  ///
  /// In en, this message translates to:
  /// **'Perfect for beginners and casual learning'**
  String get difficultyEasyDescription;

  /// No description provided for @difficultyMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get difficultyMedium;

  /// No description provided for @difficultyMediumDescription.
  ///
  /// In en, this message translates to:
  /// **'A balanced challenge for most players'**
  String get difficultyMediumDescription;

  /// No description provided for @difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get difficultyHard;

  /// No description provided for @difficultyHardDescription.
  ///
  /// In en, this message translates to:
  /// **'For experts seeking maximum challenge'**
  String get difficultyHardDescription;

  /// No description provided for @chooseYourDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Difficulty'**
  String get chooseYourDifficulty;

  /// No description provided for @chooseYourDifficultyDesc.
  ///
  /// In en, this message translates to:
  /// **'Higher difficulty means more XP rewards!'**
  String get chooseYourDifficultyDesc;

  /// No description provided for @resultExcellent.
  ///
  /// In en, this message translates to:
  /// **'Outstanding! 🏆'**
  String get resultExcellent;

  /// No description provided for @resultVeryGood.
  ///
  /// In en, this message translates to:
  /// **'Great job! 🌟'**
  String get resultVeryGood;

  /// No description provided for @resultGood.
  ///
  /// In en, this message translates to:
  /// **'Well done! 👍'**
  String get resultGood;

  /// No description provided for @resultAverage.
  ///
  /// In en, this message translates to:
  /// **'Not bad! 💪'**
  String get resultAverage;

  /// No description provided for @resultPoor.
  ///
  /// In en, this message translates to:
  /// **'Keep practicing! 📚'**
  String get resultPoor;

  /// No description provided for @resultVeryPoor.
  ///
  /// In en, this message translates to:
  /// **'Don’t give up! 💫'**
  String get resultVeryPoor;

  /// No description provided for @experienceEarned.
  ///
  /// In en, this message translates to:
  /// **'XP Earned'**
  String get experienceEarned;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @browseHint.
  ///
  /// In en, this message translates to:
  /// **'Search quizzes by title or description...'**
  String get browseHint;

  /// No description provided for @browseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore our curated collection of quizzes and level up your knowledge!'**
  String get browseSubtitle;

  /// No description provided for @browseTitle.
  ///
  /// In en, this message translates to:
  /// **'Browse Quizzes'**
  String get browseTitle;

  /// No description provided for @quizUltimateGeneralKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Ultimate General Knowledge'**
  String get quizUltimateGeneralKnowledge;

  /// No description provided for @quizFamousBooksAuthors.
  ///
  /// In en, this message translates to:
  /// **'Famous Books & Authors'**
  String get quizFamousBooksAuthors;

  /// No description provided for @quizClassicMovieTrivia.
  ///
  /// In en, this message translates to:
  /// **'Classic Movie Trivia'**
  String get quizClassicMovieTrivia;

  /// No description provided for @quizMusicLegendsLyrics.
  ///
  /// In en, this message translates to:
  /// **'Music Legends & Lyrics'**
  String get quizMusicLegendsLyrics;

  /// No description provided for @quizMusicalsTheatresMix.
  ///
  /// In en, this message translates to:
  /// **'Musicals & Theatres Mix'**
  String get quizMusicalsTheatresMix;

  /// No description provided for @quizTvSeriesCharacters.
  ///
  /// In en, this message translates to:
  /// **'TV Series & Characters'**
  String get quizTvSeriesCharacters;

  /// No description provided for @quizVideoGameUniverse.
  ///
  /// In en, this message translates to:
  /// **'Video Game Universe'**
  String get quizVideoGameUniverse;

  /// No description provided for @quizBoardGamesChallenge.
  ///
  /// In en, this message translates to:
  /// **'Board Games Challenge'**
  String get quizBoardGamesChallenge;

  /// No description provided for @quizScienceNatureInsights.
  ///
  /// In en, this message translates to:
  /// **'Science & Nature Insights'**
  String get quizScienceNatureInsights;

  /// No description provided for @quizComputerScienceBasics.
  ///
  /// In en, this message translates to:
  /// **'Computer Science Basics'**
  String get quizComputerScienceBasics;

  /// No description provided for @quizMathematicalMinds.
  ///
  /// In en, this message translates to:
  /// **'Mathematical Minds'**
  String get quizMathematicalMinds;

  /// No description provided for @quizGreekNorseMythology.
  ///
  /// In en, this message translates to:
  /// **'Greek & Norse Mythology'**
  String get quizGreekNorseMythology;

  /// No description provided for @quizUltimateSportsTrivia.
  ///
  /// In en, this message translates to:
  /// **'Ultimate Sports Trivia'**
  String get quizUltimateSportsTrivia;

  /// No description provided for @quizWorldGeographyExplorer.
  ///
  /// In en, this message translates to:
  /// **'World Geography Explorer'**
  String get quizWorldGeographyExplorer;

  /// No description provided for @quizWorldHistoryEssentials.
  ///
  /// In en, this message translates to:
  /// **'World History Essentials'**
  String get quizWorldHistoryEssentials;

  /// No description provided for @quizPoliticsWorldLeaders.
  ///
  /// In en, this message translates to:
  /// **'Politics & World Leaders'**
  String get quizPoliticsWorldLeaders;

  /// No description provided for @quizMasterpiecesArt.
  ///
  /// In en, this message translates to:
  /// **'Masterpieces of Art'**
  String get quizMasterpiecesArt;

  /// No description provided for @quizCelebritiesPopCulture.
  ///
  /// In en, this message translates to:
  /// **'Celebrities & Pop Culture'**
  String get quizCelebritiesPopCulture;

  /// No description provided for @quizAnimalsAroundWorld.
  ///
  /// In en, this message translates to:
  /// **'Animals Around the World'**
  String get quizAnimalsAroundWorld;

  /// No description provided for @quizCarsBikesMachines.
  ///
  /// In en, this message translates to:
  /// **'Cars, Bikes & Machines'**
  String get quizCarsBikesMachines;

  /// No description provided for @quizComicBooksUniverse.
  ///
  /// In en, this message translates to:
  /// **'Comic Books Universe'**
  String get quizComicBooksUniverse;

  /// No description provided for @quizCoolTechGadgets.
  ///
  /// In en, this message translates to:
  /// **'Cool Tech & Gadgets'**
  String get quizCoolTechGadgets;

  /// No description provided for @quizAnimeWorlds.
  ///
  /// In en, this message translates to:
  /// **'Anime Worlds Quiz'**
  String get quizAnimeWorlds;

  /// No description provided for @quizCartoonsAnimations.
  ///
  /// In en, this message translates to:
  /// **'Cartoons & Animations'**
  String get quizCartoonsAnimations;

  /// No description provided for @descUltimateGeneralKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Test your brain across a wide range of topics from science to pop culture.'**
  String get descUltimateGeneralKnowledge;

  /// No description provided for @descFamousBooksAuthors.
  ///
  /// In en, this message translates to:
  /// **'Can you match famous books to their legendary authors?'**
  String get descFamousBooksAuthors;

  /// No description provided for @descClassicMovieTrivia.
  ///
  /// In en, this message translates to:
  /// **'Dive into the world of cinema and recall timeless classics.'**
  String get descClassicMovieTrivia;

  /// No description provided for @descMusicLegendsLyrics.
  ///
  /// In en, this message translates to:
  /// **'Guess songs, artists, and iconic lyrics from music history.'**
  String get descMusicLegendsLyrics;

  /// No description provided for @descMusicalsTheatresMix.
  ///
  /// In en, this message translates to:
  /// **'Challenge your memory of stage shows and legendary musicals.'**
  String get descMusicalsTheatresMix;

  /// No description provided for @descTvSeriesCharacters.
  ///
  /// In en, this message translates to:
  /// **'How well do you know your favorite TV shows and characters?'**
  String get descTvSeriesCharacters;

  /// No description provided for @descVideoGameUniverse.
  ///
  /// In en, this message translates to:
  /// **'From retro games to modern hits — test your gaming knowledge!'**
  String get descVideoGameUniverse;

  /// No description provided for @descBoardGamesChallenge.
  ///
  /// In en, this message translates to:
  /// **'Chess, Monopoly, and more — explore board games trivia.'**
  String get descBoardGamesChallenge;

  /// No description provided for @descScienceNatureInsights.
  ///
  /// In en, this message translates to:
  /// **'Discover fascinating facts about science, nature, and the universe.'**
  String get descScienceNatureInsights;

  /// No description provided for @descComputerScienceBasics.
  ///
  /// In en, this message translates to:
  /// **'Explore coding, algorithms, and the evolution of computers.'**
  String get descComputerScienceBasics;

  /// No description provided for @descMathematicalMinds.
  ///
  /// In en, this message translates to:
  /// **'Numbers, formulas, and logic — challenge your math skills.'**
  String get descMathematicalMinds;

  /// No description provided for @descGreekNorseMythology.
  ///
  /// In en, this message translates to:
  /// **'Meet gods, heroes, and myths from ancient Greece and Norse lands.'**
  String get descGreekNorseMythology;

  /// No description provided for @descUltimateSportsTrivia.
  ///
  /// In en, this message translates to:
  /// **'From football to Olympics — test your sports knowledge!'**
  String get descUltimateSportsTrivia;

  /// No description provided for @descWorldGeographyExplorer.
  ///
  /// In en, this message translates to:
  /// **'Travel around the world with geography and landmark quizzes.'**
  String get descWorldGeographyExplorer;

  /// No description provided for @descWorldHistoryEssentials.
  ///
  /// In en, this message translates to:
  /// **'Key events and figures that shaped our world — how many can you name?'**
  String get descWorldHistoryEssentials;

  /// No description provided for @descPoliticsWorldLeaders.
  ///
  /// In en, this message translates to:
  /// **'Learn about global leaders, ideologies, and political systems.'**
  String get descPoliticsWorldLeaders;

  /// No description provided for @descMasterpiecesArt.
  ///
  /// In en, this message translates to:
  /// **'Famous artists, movements, and timeless masterpieces await.'**
  String get descMasterpiecesArt;

  /// No description provided for @descCelebritiesPopCulture.
  ///
  /// In en, this message translates to:
  /// **'From Hollywood to TikTok — pop culture at its finest.'**
  String get descCelebritiesPopCulture;

  /// No description provided for @descAnimalsAroundWorld.
  ///
  /// In en, this message translates to:
  /// **'Learn fun and amazing facts about animals across the globe.'**
  String get descAnimalsAroundWorld;

  /// No description provided for @descCarsBikesMachines.
  ///
  /// In en, this message translates to:
  /// **'Engines, brands, and innovations — for every motorhead.'**
  String get descCarsBikesMachines;

  /// No description provided for @descComicBooksUniverse.
  ///
  /// In en, this message translates to:
  /// **'Marvel, DC, and beyond — heroes, villains, and stories.'**
  String get descComicBooksUniverse;

  /// No description provided for @descCoolTechGadgets.
  ///
  /// In en, this message translates to:
  /// **'Test your knowledge of modern inventions and gadgets.'**
  String get descCoolTechGadgets;

  /// No description provided for @descAnimeWorlds.
  ///
  /// In en, this message translates to:
  /// **'Explore anime worlds, characters, and legendary series.'**
  String get descAnimeWorlds;

  /// No description provided for @descCartoonsAnimations.
  ///
  /// In en, this message translates to:
  /// **'From Disney to Pixar — classic and modern animation trivia.'**
  String get descCartoonsAnimations;

  /// No description provided for @browseNoCoursesFound.
  ///
  /// In en, this message translates to:
  /// **'No courses found matching your search.'**
  String get browseNoCoursesFound;

  /// No description provided for @achievementLevelingBronzeTitle.
  ///
  /// In en, this message translates to:
  /// **'Leveling Apprentice'**
  String get achievementLevelingBronzeTitle;

  /// No description provided for @achievementLevelingBronzeDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Level 5'**
  String get achievementLevelingBronzeDesc;

  /// No description provided for @achievementLevelingSilverTitle.
  ///
  /// In en, this message translates to:
  /// **'Leveling Adept'**
  String get achievementLevelingSilverTitle;

  /// No description provided for @achievementLevelingSilverDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Level 10'**
  String get achievementLevelingSilverDesc;

  /// No description provided for @achievementLevelingGoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Leveling Expert'**
  String get achievementLevelingGoldTitle;

  /// No description provided for @achievementLevelingGoldDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Level 20'**
  String get achievementLevelingGoldDesc;

  /// No description provided for @achievementLevelingPlatinumTitle.
  ///
  /// In en, this message translates to:
  /// **'Leveling Master'**
  String get achievementLevelingPlatinumTitle;

  /// No description provided for @achievementLevelingPlatinumDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Level 30'**
  String get achievementLevelingPlatinumDesc;

  /// No description provided for @achievementLevelingDiamondTitle.
  ///
  /// In en, this message translates to:
  /// **'Leveling Legend'**
  String get achievementLevelingDiamondTitle;

  /// No description provided for @achievementLevelingDiamondDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Level 50'**
  String get achievementLevelingDiamondDesc;

  /// No description provided for @achievementLevelingMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Leveling Grandmaster'**
  String get achievementLevelingMasterTitle;

  /// No description provided for @achievementLevelingMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Level 100'**
  String get achievementLevelingMasterDesc;

  /// No description provided for @achievementAnswerMasterBronzeTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer Apprentice'**
  String get achievementAnswerMasterBronzeTitle;

  /// No description provided for @achievementAnswerMasterBronzeDesc.
  ///
  /// In en, this message translates to:
  /// **'Answer 10 Questions Correctly'**
  String get achievementAnswerMasterBronzeDesc;

  /// No description provided for @achievementAnswerMasterSilverTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer Adept'**
  String get achievementAnswerMasterSilverTitle;

  /// No description provided for @achievementAnswerMasterSilverDesc.
  ///
  /// In en, this message translates to:
  /// **'Answer 25 Questions Correctly'**
  String get achievementAnswerMasterSilverDesc;

  /// No description provided for @achievementAnswerMasterGoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer Expert'**
  String get achievementAnswerMasterGoldTitle;

  /// No description provided for @achievementAnswerMasterGoldDesc.
  ///
  /// In en, this message translates to:
  /// **'Answer 50 Questions Correctly'**
  String get achievementAnswerMasterGoldDesc;

  /// No description provided for @achievementAnswerMasterPlatinumTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer Master'**
  String get achievementAnswerMasterPlatinumTitle;

  /// No description provided for @achievementAnswerMasterPlatinumDesc.
  ///
  /// In en, this message translates to:
  /// **'Answer 100 Questions Correctly'**
  String get achievementAnswerMasterPlatinumDesc;

  /// No description provided for @achievementAnswerMasterDiamondTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer Legend'**
  String get achievementAnswerMasterDiamondTitle;

  /// No description provided for @achievementAnswerMasterDiamondDesc.
  ///
  /// In en, this message translates to:
  /// **'Answer 200 Questions Correctly'**
  String get achievementAnswerMasterDiamondDesc;

  /// No description provided for @achievementAnswerMasterMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer Grandmaster'**
  String get achievementAnswerMasterMasterTitle;

  /// No description provided for @achievementAnswerMasterMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Answer 500 Questions Correctly'**
  String get achievementAnswerMasterMasterDesc;

  /// No description provided for @achievementQuizAbuserBronzeTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Novice'**
  String get achievementQuizAbuserBronzeTitle;

  /// No description provided for @achievementQuizAbuserBronzeDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 5 quizzes with 80%+ score'**
  String get achievementQuizAbuserBronzeDesc;

  /// No description provided for @achievementQuizAbuserSilverTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Enthusiast'**
  String get achievementQuizAbuserSilverTitle;

  /// No description provided for @achievementQuizAbuserSilverDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 10 quizzes with 80%+ score'**
  String get achievementQuizAbuserSilverDesc;

  /// No description provided for @achievementQuizAbuserGoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Fanatic'**
  String get achievementQuizAbuserGoldTitle;

  /// No description provided for @achievementQuizAbuserGoldDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 25 quizzes with 80%+ score'**
  String get achievementQuizAbuserGoldDesc;

  /// No description provided for @achievementQuizAbuserPlatinumTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Maniac'**
  String get achievementQuizAbuserPlatinumTitle;

  /// No description provided for @achievementQuizAbuserPlatinumDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 50 quizzes with 80%+ score'**
  String get achievementQuizAbuserPlatinumDesc;

  /// No description provided for @achievementQuizAbuserDiamondTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Legend'**
  String get achievementQuizAbuserDiamondTitle;

  /// No description provided for @achievementQuizAbuserDiamondDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 100 quizzes with 80%+ score'**
  String get achievementQuizAbuserDiamondDesc;

  /// No description provided for @achievementQuizAbuserMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Grandmaster'**
  String get achievementQuizAbuserMasterTitle;

  /// No description provided for @achievementQuizAbuserMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 250 quizzes with 80%+ score'**
  String get achievementQuizAbuserMasterDesc;

  /// No description provided for @achievementSpeedsterBronzeTitle.
  ///
  /// In en, this message translates to:
  /// **'Speedster Novice'**
  String get achievementSpeedsterBronzeTitle;

  /// No description provided for @achievementSpeedsterBronzeDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete a quiz under 60 seconds with 80%+ score'**
  String get achievementSpeedsterBronzeDesc;

  /// No description provided for @achievementSpeedsterSilverTitle.
  ///
  /// In en, this message translates to:
  /// **'Speedster Adept'**
  String get achievementSpeedsterSilverTitle;

  /// No description provided for @achievementSpeedsterSilverDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete a quiz under 50 seconds with 80%+ score'**
  String get achievementSpeedsterSilverDesc;

  /// No description provided for @achievementSpeedsterGoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Speedster Export'**
  String get achievementSpeedsterGoldTitle;

  /// No description provided for @achievementSpeedsterGoldDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete a quiz under 40 seconds with 80%+ score'**
  String get achievementSpeedsterGoldDesc;

  /// No description provided for @achievementSpeedsterPlatinumTitle.
  ///
  /// In en, this message translates to:
  /// **'Speedster Master'**
  String get achievementSpeedsterPlatinumTitle;

  /// No description provided for @achievementSpeedsterPlatinumDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete a quiz under 30 seconds with 80%+ score'**
  String get achievementSpeedsterPlatinumDesc;

  /// No description provided for @achievementSpeedsterDiamondTitle.
  ///
  /// In en, this message translates to:
  /// **'Speedster Legend'**
  String get achievementSpeedsterDiamondTitle;

  /// No description provided for @achievementSpeedsterDiamondDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete a quiz under 25 seconds with 80%+ score'**
  String get achievementSpeedsterDiamondDesc;

  /// No description provided for @achievementSpeedsterMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Speedster Grandmaster'**
  String get achievementSpeedsterMasterTitle;

  /// No description provided for @achievementSpeedsterMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete a quiz under 20 seconds with 80%+ score'**
  String get achievementSpeedsterMasterDesc;

  /// No description provided for @trackProgress.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and unlock badges'**
  String get trackProgress;

  /// No description provided for @unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlocked;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get filterLocked;

  /// No description provided for @achievementCategoryLevelingDesc.
  ///
  /// In en, this message translates to:
  /// **'Progress through levels by completing quizzes and challenges.'**
  String get achievementCategoryLevelingDesc;

  /// No description provided for @achievementCategoryAnswerMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Show your mastery by answering questions correctly and consistently.'**
  String get achievementCategoryAnswerMasterDesc;

  /// No description provided for @achievementCategoryQuizAbuserDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn achievements for completing a high number of quizzes.'**
  String get achievementCategoryQuizAbuserDesc;

  /// No description provided for @achievementCategorySpeedsterDesc.
  ///
  /// In en, this message translates to:
  /// **'Unlock achievements for completing quizzes quickly and efficiently.'**
  String get achievementCategorySpeedsterDesc;

  /// No description provided for @notUnlockedYet.
  ///
  /// In en, this message translates to:
  /// **'Not Unlocked Yet'**
  String get notUnlockedYet;

  /// No description provided for @nextAchievement.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextAchievement;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
