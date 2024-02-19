import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/views/news_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/theme/theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

ThemeData _light = ThemeData(
    brightness: Brightness.light,
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.blue));

ThemeData _dark = ThemeData(
    brightness: Brightness.dark,
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.purpleAccent));

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    _saveLocale(context.locale.languageCode);
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            title: 'Flutter News',
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDark ? _dark : _light,
            home: const NewsAppBar(),
          );
        }));
  }

  void _saveLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);
  }
}
