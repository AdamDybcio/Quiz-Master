import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_master/features/achievements/data/model/achievement.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/utils/enums.dart';

List<Achievement> getAchievements(BuildContext context) {
  return [
    Achievement(
      category: AchievementCategory.leveling,
      level: AchievementLevel.bronze,
      title: AppLocalizations.of(context)!.achievementLevelingBronzeTitle,
      description: AppLocalizations.of(context)!.achievementLevelingBronzeDesc,
      icon: FontAwesomeIcons.medal,
    ),
    Achievement(
      category: AchievementCategory.leveling,
      level: AchievementLevel.silver,
      title: AppLocalizations.of(context)!.achievementLevelingSilverTitle,
      description: AppLocalizations.of(context)!.achievementLevelingSilverDesc,
      icon: FontAwesomeIcons.medal,
    ),
    Achievement(
      category: AchievementCategory.leveling,
      level: AchievementLevel.gold,
      title: AppLocalizations.of(context)!.achievementLevelingGoldTitle,
      description: AppLocalizations.of(context)!.achievementLevelingGoldDesc,
      icon: FontAwesomeIcons.medal,
    ),
    Achievement(
      category: AchievementCategory.leveling,
      level: AchievementLevel.platinum,
      title: AppLocalizations.of(context)!.achievementLevelingPlatinumTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementLevelingPlatinumDesc,
      icon: FontAwesomeIcons.medal,
    ),
    Achievement(
      category: AchievementCategory.leveling,
      level: AchievementLevel.diamond,
      title: AppLocalizations.of(context)!.achievementLevelingDiamondTitle,
      description: AppLocalizations.of(context)!.achievementLevelingDiamondDesc,
      icon: FontAwesomeIcons.medal,
    ),
    Achievement(
      category: AchievementCategory.leveling,
      level: AchievementLevel.master,
      title: AppLocalizations.of(context)!.achievementLevelingMasterTitle,
      description: AppLocalizations.of(context)!.achievementLevelingMasterDesc,
      icon: FontAwesomeIcons.medal,
    ),
    Achievement(
      category: AchievementCategory.answerMaster,
      level: AchievementLevel.bronze,
      title: AppLocalizations.of(context)!.achievementAnswerMasterBronzeTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementAnswerMasterBronzeDesc,
      icon: FontAwesomeIcons.lightbulb,
    ),
    Achievement(
      category: AchievementCategory.answerMaster,
      level: AchievementLevel.silver,
      title: AppLocalizations.of(context)!.achievementAnswerMasterSilverTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementAnswerMasterSilverDesc,
      icon: FontAwesomeIcons.lightbulb,
    ),
    Achievement(
      category: AchievementCategory.answerMaster,
      level: AchievementLevel.gold,
      title: AppLocalizations.of(context)!.achievementAnswerMasterGoldTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementAnswerMasterGoldDesc,
      icon: FontAwesomeIcons.lightbulb,
    ),
    Achievement(
      category: AchievementCategory.answerMaster,
      level: AchievementLevel.platinum,
      title: AppLocalizations.of(context)!.achievementAnswerMasterPlatinumTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementAnswerMasterPlatinumDesc,
      icon: FontAwesomeIcons.lightbulb,
    ),
    Achievement(
      category: AchievementCategory.answerMaster,
      level: AchievementLevel.diamond,
      title: AppLocalizations.of(context)!.achievementAnswerMasterDiamondTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementAnswerMasterDiamondDesc,
      icon: FontAwesomeIcons.lightbulb,
    ),
    Achievement(
      category: AchievementCategory.answerMaster,
      level: AchievementLevel.master,
      title: AppLocalizations.of(context)!.achievementAnswerMasterMasterTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementAnswerMasterMasterDesc,
      icon: FontAwesomeIcons.lightbulb,
    ),
    Achievement(
      category: AchievementCategory.quizAbuser,
      level: AchievementLevel.bronze,
      title: AppLocalizations.of(context)!.achievementQuizAbuserBronzeTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementQuizAbuserBronzeDesc,
      icon: FontAwesomeIcons.fire,
    ),
    Achievement(
      category: AchievementCategory.quizAbuser,
      level: AchievementLevel.silver,
      title: AppLocalizations.of(context)!.achievementQuizAbuserSilverTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementQuizAbuserSilverDesc,
      icon: FontAwesomeIcons.fire,
    ),
    Achievement(
      category: AchievementCategory.quizAbuser,
      level: AchievementLevel.gold,
      title: AppLocalizations.of(context)!.achievementQuizAbuserGoldTitle,
      description: AppLocalizations.of(context)!.achievementQuizAbuserGoldDesc,
      icon: FontAwesomeIcons.fire,
    ),
    Achievement(
      category: AchievementCategory.quizAbuser,
      level: AchievementLevel.platinum,
      title: AppLocalizations.of(context)!.achievementQuizAbuserPlatinumTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementQuizAbuserPlatinumDesc,
      icon: FontAwesomeIcons.fire,
    ),
    Achievement(
      category: AchievementCategory.quizAbuser,
      level: AchievementLevel.diamond,
      title: AppLocalizations.of(context)!.achievementQuizAbuserDiamondTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementQuizAbuserDiamondDesc,
      icon: FontAwesomeIcons.fire,
    ),
    Achievement(
      category: AchievementCategory.quizAbuser,
      level: AchievementLevel.master,
      title: AppLocalizations.of(context)!.achievementQuizAbuserMasterTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementQuizAbuserMasterDesc,
      icon: FontAwesomeIcons.fire,
    ),
    Achievement(
      category: AchievementCategory.speedster,
      level: AchievementLevel.bronze,
      title: AppLocalizations.of(context)!.achievementSpeedsterBronzeTitle,
      description: AppLocalizations.of(context)!.achievementSpeedsterBronzeDesc,
      icon: FontAwesomeIcons.gaugeHigh,
    ),
    Achievement(
      category: AchievementCategory.speedster,
      level: AchievementLevel.silver,
      title: AppLocalizations.of(context)!.achievementSpeedsterSilverTitle,
      description: AppLocalizations.of(context)!.achievementSpeedsterSilverDesc,
      icon: FontAwesomeIcons.gaugeHigh,
    ),
    Achievement(
      category: AchievementCategory.speedster,
      level: AchievementLevel.gold,
      title: AppLocalizations.of(context)!.achievementSpeedsterGoldTitle,
      description: AppLocalizations.of(context)!.achievementSpeedsterGoldDesc,
      icon: FontAwesomeIcons.gaugeHigh,
    ),
    Achievement(
      category: AchievementCategory.speedster,
      level: AchievementLevel.platinum,
      title: AppLocalizations.of(context)!.achievementSpeedsterPlatinumTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementSpeedsterPlatinumDesc,
      icon: FontAwesomeIcons.gaugeHigh,
    ),
    Achievement(
      category: AchievementCategory.speedster,
      level: AchievementLevel.diamond,
      title: AppLocalizations.of(context)!.achievementSpeedsterDiamondTitle,
      description: AppLocalizations.of(
        context,
      )!.achievementSpeedsterDiamondDesc,
      icon: FontAwesomeIcons.gaugeHigh,
    ),
    Achievement(
      category: AchievementCategory.speedster,
      level: AchievementLevel.master,
      title: AppLocalizations.of(context)!.achievementSpeedsterMasterTitle,
      description: AppLocalizations.of(context)!.achievementSpeedsterMasterDesc,
      icon: FontAwesomeIcons.gaugeHigh,
    ),
  ];
}
