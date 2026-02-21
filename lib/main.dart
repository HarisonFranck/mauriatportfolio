import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';
import 'package:mauriatportfolio/pages/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Try loading root .env first (common for local development)
    await dotenv.load();
  } catch (e) {
    try {
      // On web the file may be under assets/.env — try that path as a fallback.
      await dotenv.load(fileName: 'assets/.env');
    } catch (e2) {
      // Both attempts failed — warn but continue. The AIService will throw
      // a descriptive error if no API key is available at runtime.
      print('Warning: .env not found in project root or assets: $e / $e2');
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final ValueNotifier<Locale> localeNotifier = ValueNotifier(
    const Locale('fr'),
  );

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  void setLocale(Locale locale) {
    MyApp.localeNotifier.value = locale;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: MyApp.localeNotifier,
      builder: (context, locale, child) {
        return MaterialApp(
          title: 'Mauriat Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('fr'), // French
          ],
          home: const Home(),
        );
      },
    );
  }
}
