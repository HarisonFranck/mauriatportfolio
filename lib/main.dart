import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';
import 'package:mauriatportfolio/pages/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load();
  } catch (e) {
    // On web or when .env is not present, loading may fail. Log a warning
    // and continue — missing API key will be handled where it's required.
    // This prevents the app from crashing when developers don't have a local .env.
    // If you run into issues, create a `.env` file at the project root
    // (copy `.env.example`) with `GEN_AI_API_KEY` set.
    print('Warning: .env file not found or failed to load: $e');
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
