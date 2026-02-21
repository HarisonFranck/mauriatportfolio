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
  /// **'Demande moi!'**
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

  /// No description provided for @beyondCodeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Au-delà du Code'**
  String get beyondCodeTitle;

  /// No description provided for @beyondCodeDesc.
  ///
  /// In fr, this message translates to:
  /// **'Construire un produit à succès demande plus que des compétences techniques. Je suis votre partenaire pour comprendre vos objectifs et livrer des solutions qui apportent une vraie valeur.'**
  String get beyondCodeDesc;

  /// No description provided for @beyondCodeStrategicTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résolution Stratégique'**
  String get beyondCodeStrategicTitle;

  /// No description provided for @beyondCodeStrategicDesc.
  ///
  /// In fr, this message translates to:
  /// **'Je ne code pas seulement des fonctionnalités; je résous des problèmes business. Que vous ayez un cahier des charges clair ou une idée vague, j\'aide à clarifier vos besoins.'**
  String get beyondCodeStrategicDesc;

  /// No description provided for @beyondCodeProductTitle.
  ///
  /// In fr, this message translates to:
  /// **'Esprit Produit'**
  String get beyondCodeProductTitle;

  /// No description provided for @beyondCodeProductDesc.
  ///
  /// In fr, this message translates to:
  /// **'Le pont entre ingénierie et expérience utilisateur. Je vous guide du concept au lancement pour un produit qui n\'est pas juste du code, mais un atout pour vos utilisateurs.'**
  String get beyondCodeProductDesc;

  /// No description provided for @beyondCodeCollaborativeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Partenariat Collaboratif'**
  String get beyondCodeCollaborativeTitle;

  /// No description provided for @beyondCodeCollaborativeDesc.
  ///
  /// In fr, this message translates to:
  /// **'Je travaille comme une extension de votre équipe. Communication transparente et conseils techniques pour bâtir la confiance et assurer le succès à long terme.'**
  String get beyondCodeCollaborativeDesc;

  /// No description provided for @downloadcv.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger CV'**
  String get downloadcv;

  /// No description provided for @lookforproject.
  ///
  /// In fr, this message translates to:
  /// **'Voir mes Projets'**
  String get lookforproject;

  /// No description provided for @welcoming.
  ///
  /// In fr, this message translates to:
  /// **'Bonjour, Je suis Mauriat'**
  String get welcoming;

  /// No description provided for @myDesc.
  ///
  /// In fr, this message translates to:
  /// **'Créateur d\'expériences numériques impactantes.'**
  String get myDesc;

  /// No description provided for @aboutMe.
  ///
  /// In fr, this message translates to:
  /// **'Je suis un développeur passionné par la création d\'applications web et mobiles élégantes, efficaces et évolutives. Expert de l\'écosystème JavaScript moderne avec un œil pour l\'UI/UX, je transforme des problèmes complexes en solutions intuitives.'**
  String get aboutMe;

  /// No description provided for @statut.
  ///
  /// In fr, this message translates to:
  /// **'Disponible'**
  String get statut;

  /// No description provided for @stack_flutter.
  ///
  /// In fr, this message translates to:
  /// **'Flutter'**
  String get stack_flutter;

  /// No description provided for @stack_flutterflow.
  ///
  /// In fr, this message translates to:
  /// **'Flutterflow'**
  String get stack_flutterflow;

  /// No description provided for @stack_javascript.
  ///
  /// In fr, this message translates to:
  /// **'Javascript'**
  String get stack_javascript;

  /// No description provided for @stack_angular.
  ///
  /// In fr, this message translates to:
  /// **'Angular'**
  String get stack_angular;

  /// No description provided for @stack_supabase.
  ///
  /// In fr, this message translates to:
  /// **'Supabase / Firebase'**
  String get stack_supabase;

  /// No description provided for @stack_xano.
  ///
  /// In fr, this message translates to:
  /// **'Xano'**
  String get stack_xano;

  /// No description provided for @stack_cloud_functions.
  ///
  /// In fr, this message translates to:
  /// **'Cloud Functions'**
  String get stack_cloud_functions;

  /// No description provided for @stack_sqlite.
  ///
  /// In fr, this message translates to:
  /// **'SQLite'**
  String get stack_sqlite;

  /// No description provided for @stack_postgresql.
  ///
  /// In fr, this message translates to:
  /// **'PostgreSQL'**
  String get stack_postgresql;

  /// No description provided for @stack_git.
  ///
  /// In fr, this message translates to:
  /// **'Git'**
  String get stack_git;

  /// No description provided for @stack_cicd.
  ///
  /// In fr, this message translates to:
  /// **'CI/CD'**
  String get stack_cicd;

  /// No description provided for @stack_adobexd.
  ///
  /// In fr, this message translates to:
  /// **'Adobe XD'**
  String get stack_adobexd;

  /// No description provided for @stack_vscode.
  ///
  /// In fr, this message translates to:
  /// **'Vs Code'**
  String get stack_vscode;

  /// No description provided for @stack_xcode_android.
  ///
  /// In fr, this message translates to:
  /// **'Xcode / Android Studio'**
  String get stack_xcode_android;

  /// No description provided for @stack_clean_architecture.
  ///
  /// In fr, this message translates to:
  /// **'Clean Architecture'**
  String get stack_clean_architecture;

  /// No description provided for @stack_state_management.
  ///
  /// In fr, this message translates to:
  /// **'Gestion d\'état'**
  String get stack_state_management;

  /// No description provided for @stack_api_rest.
  ///
  /// In fr, this message translates to:
  /// **'API Rest'**
  String get stack_api_rest;

  /// No description provided for @project0_title.
  ///
  /// In fr, this message translates to:
  /// **'Une application de prise de rendez-vous'**
  String get project0_title;

  /// No description provided for @project0_description.
  ///
  /// In fr, this message translates to:
  /// **'Plateforme de prise de rendez-vous médicaux permettant aux patients de rechercher des médecins, de voir les disponibilités en temps réel et de réserver des rendez-vous, avec gestion administrative centralisée.'**
  String get project0_description;

  /// No description provided for @project0_stacks.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, Adobe XD, REST API, OpenAPI'**
  String get project0_stacks;

  /// No description provided for @project1_title.
  ///
  /// In fr, this message translates to:
  /// **'Eisen Task'**
  String get project1_title;

  /// No description provided for @project1_description.
  ///
  /// In fr, this message translates to:
  /// **'Une application pour la gestion du personnel, la gestion de projet et l\'affectation des tâches, avec des modules interconnectés pour assurer une coordination et un suivi efficaces.'**
  String get project1_description;

  /// No description provided for @project1_stacks.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, Xano'**
  String get project1_stacks;

  /// No description provided for @project2_title.
  ///
  /// In fr, this message translates to:
  /// **'Tech-Innov : application de gestion du personnel'**
  String get project2_title;

  /// No description provided for @project2_description.
  ///
  /// In fr, this message translates to:
  /// **'Développement d\'une interface de gestion du personnel en Flutter, avec un tableau de bord interactif et une visualisation en temps réel des employés actifs.'**
  String get project2_description;

  /// No description provided for @project2_stacks.
  ///
  /// In fr, this message translates to:
  /// **'Flutter'**
  String get project2_stacks;

  /// No description provided for @project3_title.
  ///
  /// In fr, this message translates to:
  /// **'Application de paroles pour une choral'**
  String get project3_title;

  /// No description provided for @project3_description.
  ///
  /// In fr, this message translates to:
  /// **'Développement d\'une application de recherche de paroles de chansons gospel pour une choral, centralisant les paroles sur une plateforme unique et permettant la synchronisation avec le serveur en ligne de l\'organisation.'**
  String get project3_description;

  /// No description provided for @project3_stacks.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, Supabase, SQLite'**
  String get project3_stacks;

  /// No description provided for @exp0_title.
  ///
  /// In fr, this message translates to:
  /// **'CONSULTANT FLUTTERFLOW'**
  String get exp0_title;

  /// No description provided for @exp0_subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Oct 2025 - NOW'**
  String get exp0_subtitle;

  /// No description provided for @exp0_description.
  ///
  /// In fr, this message translates to:
  /// **'Consultant FlutterFlow & Flutter – Développement d\'une application mobile à impact social, intégrant une logique métier avancée et des fonctionnalités personnalisées via du code Flutter.'**
  String get exp0_description;

  /// No description provided for @exp0_stack.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, Flutterflow, Supabase, SQLite'**
  String get exp0_stack;

  /// No description provided for @exp1_title.
  ///
  /// In fr, this message translates to:
  /// **'CONCEPTEUR & DÉVELOPPEUR FLUTTER'**
  String get exp1_title;

  /// No description provided for @exp1_subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Oct 2025 - NOW'**
  String get exp1_subtitle;

  /// No description provided for @exp1_description.
  ///
  /// In fr, this message translates to:
  /// **'Conception et développement d\'une application intégrée pour la gestion du personnel, la gestion de projets et l\'affectation des tâches, avec des modules interconnectés pour assurer une coordination et un suivi efficaces.'**
  String get exp1_description;

  /// No description provided for @exp1_stack.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, Supabase, SQLite'**
  String get exp1_stack;

  /// No description provided for @exp2_title.
  ///
  /// In fr, this message translates to:
  /// **'DÉVELOPPEUR FLUTTER & FLUTTERFLOW'**
  String get exp2_title;

  /// No description provided for @exp2_subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Freelance'**
  String get exp2_subtitle;

  /// No description provided for @exp2_description.
  ///
  /// In fr, this message translates to:
  /// **'Développement d\'une application de gestion de tournois d\'échecs multiplateforme en utilisant FlutterFlow pour le prototypage et l\'implémentation de la logique, avec des fonctionnalités étendues via du code Flutter personnalisé.'**
  String get exp2_description;

  /// No description provided for @exp2_stack.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, Supabase, Flutterflow, SQLite'**
  String get exp2_stack;

  /// No description provided for @exp3_title.
  ///
  /// In fr, this message translates to:
  /// **'DÉVELOPPEUR FLUTTER'**
  String get exp3_title;

  /// No description provided for @exp3_subtitle.
  ///
  /// In fr, this message translates to:
  /// **'DEC 2023 - MAI 2024'**
  String get exp3_subtitle;

  /// No description provided for @exp3_description.
  ///
  /// In fr, this message translates to:
  /// **'Développement d\'une application de prise de rendez-vous comportant trois rôles utilisateurs (Administrateur, Docteur et Patient), permettant la planification en fonction des disponibilités du médecin sélectionné et du calendrier.'**
  String get exp3_description;

  /// No description provided for @exp3_stack.
  ///
  /// In fr, this message translates to:
  /// **'Flutter, openAPI'**
  String get exp3_stack;
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
