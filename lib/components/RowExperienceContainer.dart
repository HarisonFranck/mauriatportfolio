import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';

// ignore: must_be_immutable
class RowExperienceContainer extends StatefulWidget {
  RowExperienceContainer({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.link,
    required this.stack,
    required this.onHoverIndex,
    required this.myIndex,
    required this.isLeft,
    this.onTapContainer,
  });

  String title;
  String subtitle;
  String description;
  String link;
  String stack;
  int onHoverIndex = 100;
  int myIndex;
  bool isLeft;

  final onTapContainer;

  @override
  State<RowExperienceContainer> createState() => _RowExperienceContainerState();
}

class _RowExperienceContainerState extends State<RowExperienceContainer> {
  void onHoverEnter(PointerEnterEvent event, int index) {
    setState(() {
      widget.onHoverIndex = widget.myIndex;
    });
  }

  void onHoverExit(PointerExitEvent event) {
    setState(() {
      widget.onHoverIndex = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 850;

    return Container(
      height: isMobile ? 260 : 300,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: (widget.isLeft && !isMobile)
                ? TextDirection.ltr
                : TextDirection.rtl,
            spacing: 15,
            children: [
              MouseRegion(
                onEnter: (event) => onHoverEnter(event, 0),
                onExit: onHoverExit,
                child: Container(
                  width: isMobile ? screenWidth - 40 : 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(20, 68, 152, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: (widget.onHoverIndex == widget.myIndex)
                          ? Colors.blueAccent
                          : Colors.white12,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.start,
                          widget.subtitle,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 91, 108, 193),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.settings_rounded,
                                    color: Colors.white38,
                                    size: 18,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.stack,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(endIndent: 100, color: Colors.white24),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.description,
                            style: TextStyle(color: Colors.white38),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (!isMobile)
                Container(
                  width: 415,
                  height: 250,
                  decoration: BoxDecoration(
                    border: (widget.isLeft)
                        ? Border(left: BorderSide(color: Colors.white12))
                        : Border(right: BorderSide(color: Colors.white12)),
                  ),
                ),
            ],
          ),
          if (!isMobile)
            Align(
              alignment: AlignmentGeometry.xy(0, -0.15),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 14, 20, 37),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 87, 105, 195),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

List<RowExperienceContainer> getListExperience(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return [
    RowExperienceContainer(
      isLeft: true,
      myIndex: 0,
      title: l10n.exp0_title,
      subtitle: l10n.exp0_subtitle,
      description: l10n.exp0_description,
      link: "",
      stack: l10n.exp0_stack,
      onHoverIndex: 0,
    ),

    RowExperienceContainer(
      isLeft: false,
      myIndex: 1,
      title: l10n.exp1_title,
      subtitle: l10n.exp1_subtitle,
      description: l10n.exp1_description,
      link: "",
      stack: l10n.exp1_stack,
      onHoverIndex: 1,
    ),
    RowExperienceContainer(
      isLeft: true,
      myIndex: 2,
      title: l10n.exp2_title,
      subtitle: l10n.exp2_subtitle,
      description: l10n.exp2_description,
      link: "",
      stack: l10n.exp2_stack,
      onHoverIndex: 2,
    ),

    RowExperienceContainer(
      isLeft: false,
      myIndex: 3,
      title: l10n.exp3_title,
      subtitle: l10n.exp3_subtitle,
      description: l10n.exp3_description,
      link: "",
      stack: l10n.exp3_stack,
      onHoverIndex: 3,
    ),
  ];
}
