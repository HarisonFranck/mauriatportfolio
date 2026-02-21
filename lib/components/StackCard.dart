import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mauriatportfolio/components/StackTile.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';

class Stackcard extends StatefulWidget {
  Stackcard({
    required this.myId,
    required this.name,
    required this.cardIcon,
    required this.myStackTiles,
  });

  int hoverCard = 100;
  int myId;
  String name;
  IconData cardIcon;
  List<StackTile> myStackTiles;

  @override
  State<Stackcard> createState() => _StackcardState();
}

class _StackcardState extends State<Stackcard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth < 380 ? screenWidth - 40 : 330;

    return Container(
      height: 380,
      width: cardWidth,

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 14, 20, 37),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 15,
            color: const Color.fromARGB(57, 96, 102, 139),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white38),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Container(
                  width: 55,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(63, 112, 111, 200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      Icon(
                            widget.cardIcon,
                            color: const Color.fromARGB(255, 113, 111, 200),
                          )
                          .animate(
                            onPlay: (AnimationController controller) =>
                                controller.repeat(reverse: true),
                          )
                          .move(
                            delay: Duration(milliseconds: 100),
                            duration: Duration(milliseconds: 900),
                            begin: Offset(0, -7),
                            end: Offset(0, 3),
                            curve: Curves.easeInOut,
                          ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.name,
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              for (int i = 0; i < widget.myStackTiles.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    height: 35,
                    //color: Colors.amber,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      spacing: 15,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 90, 88, 194),
                          ),
                        ),

                        Text(
                          localizedStackName(
                            context,
                            widget.myStackTiles[i].stackKey,
                          ),
                          style: TextStyle(
                            letterSpacing: 1.2,
                            color: const Color.fromARGB(108, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

List<Stackcard> getListStackCards(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return [
    Stackcard(
      myId: 0,
      name: l10n.sect1,
      cardIcon: Icons.phone_iphone_outlined,
      myStackTiles: stackTiles.where((tile) => tile.sectionId == 0).toList(),
    ),
    Stackcard(
      myId: 1,
      name: l10n.sect2,
      cardIcon: Icons.storage_rounded,
      myStackTiles: stackTiles.where((tile) => tile.sectionId == 1).toList(),
    ),
    Stackcard(
      myId: 2,
      name: l10n.sect3,
      cardIcon: Icons.web_outlined,
      myStackTiles: stackTiles.where((tile) => tile.sectionId == 2).toList(),
    ),
  ];
}
