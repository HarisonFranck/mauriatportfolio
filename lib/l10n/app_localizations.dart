import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In fr, this message translates to:
  /// **'Portfolio de Mauriat'**
  String get appTitle;

  /// No description provided for @aiAssistantTitle.
  ///
  /// In fr, this message translates to:
  /// **'Portfolio de Mauriat'**
  String get aiAssistantTitle;

  /// No description provided for @aiAssistantSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Propulsé par Gemini'**
  String get aiAssistantSubtitle;

  /// No description provided for @aiWelcomeMessage.
  ///
  /// In fr, this message translates to:
  /// **'Bonjour ! Je suis l\'assistant IA de Mauriat.\nPosez-moi des questions sur ses compétences, ses projets ou son expérience !'**
  String get aiWelcomeMessage;

  /// No description provided for @aiErrorMessage.
  ///
  /// In fr, this message translates to:
  /// **'Désolé, une erreur est survenue.'**
  String get aiErrorMessage;

  /// No description provided for @aiInputHint.
  ///
  /// In fr, this message translates to:
  /// **'Posez une question...'**
  String get aiInputHint;

  /// No description provided for @skillsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Compétences Techniques'**
  String get skillsTitle;

  /// No description provided for @projectsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projets Clés'**
  String get projectsTitle;

  /// No description provided for @experienceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Expérience Professionnelle'**
  String get experienceTitle;

  /// No description provided for @contactTitle.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get contactTitle;

  /// No description provided for @viewProject.
  ///
  /// In fr, this message translates to:
  /// **'Voir le projet'**
  String get viewProject;

  /// No description provided for @language.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @nav1.
  ///
  /// In fr, this message translates to:
  /// **'A propos'**
  String get nav1;

  /// No description provided for @nav2.
  ///
  /// In fr, this message translates to:
  /// **'Compétences'**
  String get nav2;

  /// No description provided for @nav3.
  ///
  /// In fr, this message translates to:
  /// **'Projet'**
  String get nav3;

  /// No description provided for @nav4.
  ///
  /// In fr, this message translates to:
  /// **'Expérience'**
  String get nav4;

  /// No description provided for @nav5.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get nav5;

  /// No description provided for @skillTitle.
  ///
  /// In fr, this message translates to:
  /// **'Compétences techniques'**
  String get skillTitle;

  /// No description provided for @skillDesc.
  ///
  /// In fr, this message translates to:
  /// **'Outils et technologies que j\'utilise pour créer des produits numériques.'**
  String get skillDesc;

  /// No description provided for @projectTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projets en vedette'**
  String get projectTitle;

  /// No description provided for @github.
  ///
  /// In fr, this message translates to:
  /// **'Voir sur GitHub'**
  String get github;

  /// No description provided for @expTitle.
  ///
  /// In fr, this message translates to:
  /// **'EXPÉRIENCE PROFESSIONNELLE'**
  String get expTitle;

  /// No description provided for @contact.
  ///
  /// In fr, this message translates to:
  /// **'Entrer en contact'**
  String get contact;

  /// No description provided for @contactDesc.
  ///
  /// In fr, this message translates to:
  /// **'Je suis actuellement à la recherche de nouvelles opportunités. Que vous ayez une question ou que vous souhaitiez simplement me saluer, je ferai de mon mieux pour vous répondre !'**
  String get contactDesc;

  /// No description provided for @copyright.
  ///
  /// In fr, this message translates to:
  /// **'© 2026 Mauriat Franck. Tous droits réservés.'**
  String get copyright;

  /// No description provided for @sect1.
  ///
  /// In fr, this message translates to:
  /// **'Mobile & Frontend'**
  String get sect1;

  /// No description provided for @sect2.
  ///
  /// In fr, this message translates to:
  /// **'Backend & base de données'**
  String get sect2;

  /// No description provided for @sect3.
  ///
  /// In fr, this message translates to:
  /// **'Architecture & stratégie'**
  String get sect3;
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
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
