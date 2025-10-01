import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_master/core/presentation/blocs/theme_cubit.dart';
import 'package:quiz_master/di.dart';
import 'package:quiz_master/l10n/app_localizations.dart';
import 'package:quiz_master/l10n/l10n.dart';
import 'package:quiz_master/main_screen.dart';
import 'package:quiz_master/theme/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: sl<ThemeCubit>(),
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QuizMaster',
          supportedLocales: L10n.all,
          locale: const Locale('en'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: state.themeMode,
          home: const MainScreen(),
        );
      },
    );
  }
}
