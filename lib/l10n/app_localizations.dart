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
