import 'dart:ui';

import 'package:mauriatportfolio/l10n/app_localizations.dart';
import 'package:mauriatportfolio/main.dart';
import 'package:mauriatportfolio/Utilities/Utilitie.dart';
import 'package:mauriatportfolio/components/HeaderNav.dart';
import 'package:mauriatportfolio/components/ProjectCard.dart';
import 'package:mauriatportfolio/components/RowExperienceContainer.dart';
import 'package:mauriatportfolio/components/StackCard.dart';
import 'package:mauriatportfolio/components/BeyondCodeSection.dart';
import 'package:mauriatportfolio/components/AIChatWidget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int indexNav = 0;
  int indexHover = 100;
  //int projectHoverIndex = 100;
  bool isHoverGitHubLink = false;
  late ScrollController scroll;

  @override
  void initState() {
    super.initState();
    scroll = ScrollController();
  }

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  void hoverEnterNav(PointerEvent event, int index) {
    setState(() {
      indexHover = index;
    });
  }

  void hoverExitNav(PointerEvent event) {
    setState(() {
      indexHover = 100;
    });
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: isActive
            ? const Color.fromARGB(255, 72, 94, 215).withOpacity(0.1)
            : Colors.transparent,
        leading: Icon(
          icon,
          color: isActive
              ? const Color.fromARGB(255, 29, 171, 196)
              : Colors.white60,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white60,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            letterSpacing: 1.1,
          ),
        ),
        onTap: onTap,
        hoverColor: const Color.fromARGB(255, 72, 94, 215).withOpacity(0.1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get localizations
    final l10n = AppLocalizations.of(context)!;
    final stackCards = getListStackCards(context);
    final projects = getProjects(context);
    final experiences = getListExperience(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
    final bool isMobile = width < 800;
    final bool isPhone = width < 480;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 7, 18),
      drawer: isMobile
          ? Drawer(
              backgroundColor:
                  Colors.transparent, // Let Container handle gradient
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 3, 7, 18),
                      Color.fromARGB(255, 10, 14, 35),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      // Drawer Header
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  72,
                                  94,
                                  215,
                                ).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color.fromARGB(50, 72, 94, 215),
                                ),
                              ),
                              child: const Icon(
                                Icons.code_rounded,
                                color: Color.fromARGB(255, 72, 94, 215),
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              l10n.appTitle,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(251, 29, 171, 196),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: Colors.white12, height: 1),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          children: [
                            _buildDrawerItem(
                              icon: Icons.person_outline,
                              title: l10n.nav1,
                              onTap: () {
                                Navigator.pop(context);
                                scroll.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.workspace_premium_outlined,
                              title: l10n.nav2,
                              onTap: () {
                                Navigator.pop(context);
                                scroll.animateTo(
                                  height,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.code_outlined,
                              title: l10n.nav3,
                              onTap: () {
                                Navigator.pop(context);
                                scroll.animateTo(
                                  height * 1.9,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.work_outline,
                              title: l10n.nav4,
                              onTap: () {
                                Navigator.pop(context);
                                scroll.animateTo(
                                  height * 3.48,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.mail_outline,
                              title: l10n.nav5,
                              onTap: () {
                                Navigator.pop(context);
                                scroll.animateTo(
                                  height * 5,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Text(
                                "LANGUAGE",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            _buildDrawerItem(
                              icon: Icons.language,
                              title: 'Français',
                              isActive:
                                  Localizations.localeOf(
                                    context,
                                  ).languageCode ==
                                  'fr',
                              onTap: () {
                                final myApp = context
                                    .findAncestorStateOfType<MyAppState>();
                                myApp?.setLocale(const Locale('fr'));
                                Navigator.pop(context);
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.language,
                              title: 'English',
                              isActive:
                                  Localizations.localeOf(
                                    context,
                                  ).languageCode ==
                                  'en',
                              onTap: () {
                                final myApp = context
                                    .findAncestorStateOfType<MyAppState>();
                                myApp?.setLocale(const Locale('en'));
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 3, 7, 18),
                  Color.fromARGB(255, 10, 14, 35),
                ],
              ),
            ),
            child: Container(
              child: SafeArea(
                child: Column(
                  children: [
                    // Header (responsive)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: SizedBox(
                        width: width - 40, // Subtract padding
                        child: isMobile
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Small logo + title
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            72,
                                            94,
                                            215,
                                          ).withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.code_rounded,
                                          color: Color.fromARGB(
                                            255,
                                            72,
                                            94,
                                            215,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        l10n.appTitle,
                                        style: TextStyle(
                                          fontSize: isPhone ? 18 : 20,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                            251,
                                            29,
                                            171,
                                            196,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Drawer button
                                  Builder(
                                    builder: (context) {
                                      return IconButton(
                                        icon: const Icon(Icons.menu),
                                        color: Colors.white,
                                        onPressed: () =>
                                            Scaffold.of(context).openDrawer(),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Logo / Name
                                  Container(
                                    width: width / 3,
                                    height: 50,

                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                              255,
                                              72,
                                              94,
                                              215,
                                            ).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.code_rounded,
                                            color: Color.fromARGB(
                                              255,
                                              72,
                                              94,
                                              215,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        ShaderMask(
                                          shaderCallback: (bounds) =>
                                              const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                    255,
                                                    72,
                                                    94,
                                                    215,
                                                  ),
                                                  Color.fromARGB(
                                                    255,
                                                    45,
                                                    146,
                                                    166,
                                                  ),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ).createShader(bounds),
                                          child: Text(
                                            l10n.appTitle,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                251,
                                                29,
                                                171,
                                                196,
                                              ),
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Navigation Row
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      spacing: 15,
                                      children: [
                                        HeaderNav(
                                          indexNav: indexNav,
                                          indexHover: indexHover,
                                          name: l10n.nav1,
                                          myIndex: 0,
                                          onEnterHover: (event) =>
                                              hoverEnterNav(event, 0),
                                          onExitHover: hoverExitNav,
                                          onTapNav: () {
                                            scroll.animateTo(
                                              0,
                                              duration: Duration(
                                                milliseconds: 600,
                                              ),
                                              curve: Curves.easeOut,
                                            );
                                          },
                                        ),
                                        HeaderNav(
                                          indexNav: indexNav,
                                          indexHover: indexHover,
                                          name: l10n.nav2,
                                          myIndex: 1,
                                          onEnterHover: (event) =>
                                              hoverEnterNav(event, 1),
                                          onExitHover: hoverExitNav,
                                          onTapNav: () {
                                            scroll.animateTo(
                                              height - 60,
                                              duration: Duration(
                                                milliseconds: 600,
                                              ),
                                              curve: Curves.easeOut,
                                            );
                                          },
                                        ),
                                        HeaderNav(
                                          indexNav: indexNav,
                                          indexHover: indexHover,
                                          name: l10n.nav3,
                                          myIndex: 2,
                                          onEnterHover: (event) =>
                                              hoverEnterNav(event, 2),
                                          onExitHover: hoverExitNav,
                                          onTapNav: () {
                                            scroll.animateTo(
                                              height * 2.26,
                                              duration: Duration(
                                                milliseconds: 600,
                                              ),
                                              curve: Curves.easeOut,
                                            );
                                          },
                                        ),
                                        HeaderNav(
                                          indexNav: indexNav,
                                          indexHover: indexHover,
                                          name: l10n.nav4,
                                          myIndex: 3,
                                          onEnterHover: (event) =>
                                              hoverEnterNav(event, 3),
                                          onExitHover: hoverExitNav,
                                          onTapNav: () {
                                            scroll.animateTo(
                                              height * 3.82,
                                              duration: Duration(
                                                milliseconds: 600,
                                              ),
                                              curve: Curves.easeOut,
                                            );
                                          },
                                        ),
                                        HeaderNav(
                                          indexNav: indexNav,
                                          indexHover: indexHover,
                                          name: l10n.nav5,
                                          myIndex: 4,
                                          onEnterHover: (event) =>
                                              hoverEnterNav(event, 4),
                                          onExitHover: hoverExitNav,
                                          onTapNav: () {
                                            scroll.animateTo(
                                              height * 5.2,
                                              duration: Duration(
                                                milliseconds: 600,
                                              ),
                                              curve: Curves.easeOut,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Language Switcher
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // French Button
                                        MouseRegion(
                                          onEnter: (event) {
                                            setState(() {
                                              // Hover effect for FR button
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              // Remove hover effect
                                            });
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              final myApp = context
                                                  .findAncestorStateOfType<
                                                    MyAppState
                                                  >();
                                              myApp?.setLocale(
                                                const Locale('fr'),
                                              );
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                              decoration: BoxDecoration(
                                                color:
                                                    Localizations.localeOf(
                                                          context,
                                                        ).languageCode ==
                                                        'fr'
                                                    ? const Color.fromARGB(
                                                        255,
                                                        72,
                                                        94,
                                                        215,
                                                      ).withOpacity(0.3)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color:
                                                      Localizations.localeOf(
                                                            context,
                                                          ).languageCode ==
                                                          'fr'
                                                      ? const Color.fromARGB(
                                                          255,
                                                          72,
                                                          94,
                                                          215,
                                                        )
                                                      : Colors.transparent,
                                                ),
                                              ),
                                              child: const Text(
                                                'FR',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        // English Button
                                        MouseRegion(
                                          onEnter: (event) {
                                            setState(() {
                                              // Hover effect for EN button
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              // Remove hover effect
                                            });
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              final myApp = context
                                                  .findAncestorStateOfType<
                                                    MyAppState
                                                  >();
                                              myApp?.setLocale(
                                                const Locale('en'),
                                              );
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                              decoration: BoxDecoration(
                                                color:
                                                    Localizations.localeOf(
                                                          context,
                                                        ).languageCode ==
                                                        'en'
                                                    ? const Color.fromARGB(
                                                        255,
                                                        72,
                                                        94,
                                                        215,
                                                      ).withOpacity(0.3)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color:
                                                      Localizations.localeOf(
                                                            context,
                                                          ).languageCode ==
                                                          'en'
                                                      ? const Color.fromARGB(
                                                          255,
                                                          72,
                                                          94,
                                                          215,
                                                        )
                                                      : Colors.transparent,
                                                ),
                                              ),
                                              child: const Text(
                                                'EN',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: ListView(
                          controller: scroll,
                          children: [
                            Container(
                              width: width,
                              height: height - 100,
                              child: isMobile
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text block
                                        Container(
                                          width: width - 40,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 30,
                                                padding: EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                      147,
                                                      131,
                                                      108,
                                                      195,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: const Color.fromARGB(
                                                    72,
                                                    144,
                                                    144,
                                                    210,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color:
                                                            const Color.fromARGB(
                                                              255,
                                                              131,
                                                              108,
                                                              195,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "Disponible",
                                                      style: TextStyle(
                                                        color:
                                                            const Color.fromARGB(
                                                              255,
                                                              131,
                                                              108,
                                                              195,
                                                            ),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    const LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                          255,
                                                          255,
                                                          255,
                                                          255,
                                                        ),
                                                        Color.fromARGB(
                                                          255,
                                                          72,
                                                          94,
                                                          215,
                                                        ),
                                                        Color.fromARGB(
                                                          255,
                                                          45,
                                                          146,
                                                          166,
                                                        ),
                                                      ],
                                                      stops: [0.0, 0.6, 1.0],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ).createShader(bounds),
                                                child: Text(
                                                  "Hi, I'm Mauriat",
                                                  style: TextStyle(
                                                    fontSize: isPhone ? 36 : 48,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "Créateur d'expériences numériques impactantes.",
                                                style: TextStyle(
                                                  fontSize: isPhone ? 14 : 18,
                                                  color: Colors.white38,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "Je suis un développeur passionné par la création d'applications web et mobiles élégantes, efficaces et évolutives. Expert de l'écosystème JavaScript moderne avec un œil pour l'UI/UX, je transforme des problèmes complexes en solutions intuitives.",
                                                style: TextStyle(
                                                  color: Colors.white30,
                                                  fontSize: isPhone ? 12 : 14,
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                              Wrap(
                                                spacing: 12,
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          MaterialStateProperty.all(
                                                            Size(
                                                              isPhone
                                                                  ? 140
                                                                  : 160,
                                                              40,
                                                            ),
                                                          ),
                                                      backgroundColor:
                                                          MaterialStateProperty.all(
                                                            Color.fromARGB(
                                                              255,
                                                              72,
                                                              94,
                                                              215,
                                                            ),
                                                          ),
                                                    ),
                                                    onPressed: () {
                                                      scroll.animateTo(
                                                        height * 2.3,
                                                        duration: Duration(
                                                          milliseconds: 600,
                                                        ),
                                                        curve: Curves.easeOut,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          l10n.lookforproject,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          MaterialStateProperty.all(
                                                            Size(
                                                              isPhone
                                                                  ? 140
                                                                  : 160,
                                                              40,
                                                            ),
                                                          ),
                                                      backgroundColor:
                                                          MaterialStateProperty.all(
                                                            const Color.fromARGB(
                                                              133,
                                                              106,
                                                              121,
                                                              163,
                                                            ),
                                                          ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          l10n.downloadcv,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(
                                                          Icons
                                                              .download_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 18),
                                        // Avatar
                                        Container(
                                          width: width * 0.6,
                                          height: width * 0.6,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                31,
                                                106,
                                                121,
                                                163,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              width * 0.6,
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: width * 0.45,
                                              height: width * 0.45,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                    57,
                                                    106,
                                                    121,
                                                    163,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      width * 0.45,
                                                    ),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: width * 0.38,
                                                  height: width * 0.38,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          width * 0.38,
                                                        ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/me.jpg",
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 20,
                                      children: [
                                        Container(
                                          width: width / 2.3,

                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 15,
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 30,
                                                padding: EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                      147,
                                                      131,
                                                      108,
                                                      195,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: const Color.fromARGB(
                                                    72,
                                                    144,
                                                    144,
                                                    210,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  spacing: 15,
                                                  children: [
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color:
                                                            const Color.fromARGB(
                                                              255,
                                                              131,
                                                              108,
                                                              195,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      l10n.statut,
                                                      style: TextStyle(
                                                        color:
                                                            const Color.fromARGB(
                                                              255,
                                                              131,
                                                              108,
                                                              195,
                                                            ),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    const LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                          255,
                                                          255,
                                                          255,
                                                          255,
                                                        ),
                                                        Color.fromARGB(
                                                          255,
                                                          72,
                                                          94,
                                                          215,
                                                        ),
                                                        Color.fromARGB(
                                                          255,
                                                          45,
                                                          146,
                                                          166,
                                                        ),
                                                      ],
                                                      stops: [0.0, 0.6, 1.0],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ).createShader(bounds),
                                                child: Text(
                                                  l10n.welcoming,
                                                  style: TextStyle(
                                                    fontSize: 70,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                l10n.myDesc,
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  color: Colors.white38,
                                                ),
                                              ),
                                              Text(
                                                l10n.aboutMe,
                                                style: TextStyle(
                                                  color: Colors.white30,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                spacing: 30,
                                                children: [
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          WidgetStatePropertyAll(
                                                            Size(160, 40),
                                                          ),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                            Color.fromARGB(
                                                              255,
                                                              72,
                                                              94,
                                                              215,
                                                            ),
                                                          ),
                                                    ),
                                                    onPressed: () {
                                                      scroll.animateTo(
                                                        height * 2.3,
                                                        duration: Duration(
                                                          milliseconds: 600,
                                                        ),
                                                        curve: Curves.easeOut,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      spacing: 10,
                                                      children: [
                                                        Text(
                                                          l10n.lookforproject,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          WidgetStatePropertyAll(
                                                            Size(160, 40),
                                                          ),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                            const Color.fromARGB(
                                                              133,
                                                              106,
                                                              121,
                                                              163,
                                                            ),
                                                          ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      spacing: 10,
                                                      children: [
                                                        Text(
                                                          l10n.downloadcv,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .download_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: width / 2.5,
                                          height: width / 2.5,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                31,
                                                106,
                                                121,
                                                163,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              width / 2.5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: width / 3,
                                              height: width / 3,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                    57,
                                                    106,
                                                    121,
                                                    163,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      width / 3,
                                                    ),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: width / 3.5,
                                                  height: width / 3.5,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          width / 3.5,
                                                        ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/me.jpg",
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            Container(
                              width: width,
                              height: height + 300,
                              child: Column(
                                children: [
                                  SizedBox(height: 50),
                                  Center(
                                    child: Text(
                                      l10n.skillTitle,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      l10n.skillDesc,
                                      style: TextStyle(color: Colors.white30),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    width: double.infinity,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 30,
                                      runSpacing: 30,
                                      children: [
                                        for (
                                          int i = 0;
                                          i < stackCards.length;
                                          i++
                                        ) ...[stackCards[i]],
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 16.0 : 120.0,
                                    ),
                                    child: BeyondCodeSection(),
                                  ),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ),
                            Container(
                              color: const Color.fromARGB(57, 96, 102, 139),
                              width: width,
                              height: height + 500,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 16.0 : 120.0,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 50),
                                    Container(
                                      width: isMobile
                                          ? width - 32
                                          : width / 1.5,
                                      child: isMobile
                                          ? Column(
                                              children: [
                                                // Header
                                                Text(
                                                  l10n.projectTitle,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Divider(
                                                  endIndent: 0,
                                                  indent: 0,
                                                  thickness: 5,
                                                  color: const Color.fromARGB(
                                                    251,
                                                    29,
                                                    171,
                                                    196,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 90,
                                                  width: 300,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        l10n.projectTitle,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 32,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Divider(
                                                        endIndent: 150,
                                                        indent: 30,
                                                        thickness: 5,
                                                        color:
                                                            const Color.fromARGB(
                                                              251,
                                                              29,
                                                              171,
                                                              196,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Align(
                                                  alignment: AlignmentGeometry
                                                      .topRight,
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    onEnter: (event) {
                                                      setState(() {
                                                        isHoverGitHubLink =
                                                            true;
                                                      });
                                                    },
                                                    onExit: (event) {
                                                      setState(() {
                                                        isHoverGitHubLink =
                                                            false;
                                                      });
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        Utilitie().urlLaunch(
                                                          "https://github.com/HarisonFranck/",
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 155,
                                                        height: 50,
                                                        padding:
                                                            EdgeInsets.only(
                                                              right: 20,
                                                            ),
                                                        child: Row(
                                                          spacing: 5,
                                                          children: [
                                                            Text(
                                                              l10n.github,
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    (isHoverGitHubLink)
                                                                    ? const Color.fromARGB(
                                                                        255,
                                                                        119,
                                                                        115,
                                                                        182,
                                                                      )
                                                                    : const Color.fromARGB(
                                                                        205,
                                                                        167,
                                                                        131,
                                                                        185,
                                                                      ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 15,
                                                              height: 10,
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                  image: AssetImage(
                                                                    'assets/images/github1.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),

                                    Container(
                                      width: isMobile
                                          ? width - 32
                                          : width / 1.4,
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        direction: Axis.horizontal,
                                        spacing: 20,
                                        runSpacing: 20,
                                        children: [
                                          for (
                                            int i = 0;
                                            i < projects.length;
                                            i++
                                          ) ...[
                                            ProjectCard(
                                              myIndex: projects[i].myIndex,
                                              title: projects[i].title,
                                              description:
                                                  projects[i].description,
                                              pathImage: projects[i].pathImage,
                                              link: projects[i].link,
                                              stackNames:
                                                  projects[i].stackNames,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              height: height + 600,

                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Text(
                                        l10n.expTitle,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 70),

                                    for (
                                      int i = 0;
                                      i < experiences.length;
                                      i++
                                    ) ...[
                                      RowExperienceContainer(
                                        isLeft: experiences[i].isLeft,
                                        title: experiences[i].title,
                                        subtitle: experiences[i].subtitle,
                                        description: experiences[i].description,
                                        link: experiences[i].link,
                                        stack: experiences[i].stack,
                                        onHoverIndex:
                                            experiences[i].onHoverIndex,
                                        myIndex: experiences[i].myIndex,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              height: height - 300,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: AlignmentGeometry.topCenter,
                                  end: AlignmentGeometry.bottomCenter,
                                  colors: [
                                    const Color.fromARGB(57, 68, 71, 97),
                                    const Color.fromARGB(255, 4, 6, 11),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: Center(
                                      child: Text(
                                        l10n.contact,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 3,
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        l10n.contactDesc,
                                        style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          fixedSize: WidgetStatePropertyAll(
                                            Size(160, 50),
                                          ),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    10,
                                                  ),
                                            ),
                                          ),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                const Color.fromARGB(
                                                  255,
                                                  100,
                                                  91,
                                                  193,
                                                ),
                                              ),
                                        ),
                                        onPressed: () {
                                          const String textToCopy =
                                              "hmauriatfranck@gmail.com";

                                          Utilitie().launchMailTo(
                                            textToCopy,
                                            "Objet du message ici",
                                          );
                                        },
                                        child: Row(
                                          spacing: 10,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.message_rounded,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Say Hello",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Divider(
                                    indent: 400,
                                    endIndent: 400,
                                    color: Colors.white24,
                                  ),
                                  Container(
                                    width: width / 1.9,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          l10n.copyright,
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              139,
                                              165,
                                              177,
                                              235,
                                            ),
                                            fontSize: 13,
                                          ),
                                        ),
                                        Container(
                                          width: 110,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Utilitie().urlLaunch(
                                                    "https://github.com/HarisonFranck/",
                                                  );
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/github.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Utilitie().urlLaunch(
                                                    "https://www.linkedin.com/in/mauriat-franck-462640272/",
                                                  );
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/linkedin.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  const String textToCopy =
                                                      "+261 34 56 241 03";
                                                  Clipboard.setData(
                                                    const ClipboardData(
                                                      text: textToCopy,
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Numéro copié dans le presse-papiers',
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/whatsapp.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          AIChatWidget(),
        ],
      ),
    );
  }
}
