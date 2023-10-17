import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_pr/core/theme/application_theme.dart';
import 'package:islamic_pr/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'Module/Splash_screen.dart';
import 'layout/hadeth/hadeth_details.dart';
import 'layout/home_screen.dart';
import 'layout/quran/quran_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    AppConfigProvider provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetails.routeName: (context) => QuranDetails(),
        HadethDetales.RouteNAme: (context) => HadethDetales(),
      },
      locale: Locale(provider.AppLang),
      theme: ThemeApp.lightTheme,
      themeMode: provider.appMode,
      darkTheme: ThemeApp.DarkTheme,
    );
  }
}
