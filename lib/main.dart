import 'package:library_roobin/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_roobin/config/module.dart';
import 'package:library_roobin/config/library_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = LibraryPreferences();
  await prefs.initPrefs();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const NavigationApp(),
    ),
  );
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    @override
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    Intl.defaultLocale = 'es';

    return MaterialApp(
      title: 'Library App',
      initialRoute: Modular.initialRoute,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ).modular();
  }
}
