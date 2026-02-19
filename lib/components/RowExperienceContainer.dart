import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: 300,

      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: (widget.isLeft)
                ? TextDirection.ltr
                : TextDirection.rtl,
            spacing: 15,
            children: [
              MouseRegion(
                onEnter: (event) => onHoverEnter(event, 0),
                onExit: onHoverExit,
                child: Container(
                  width: 400,
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
                                  Text(
                                    widget.stack,
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(endIndent: 100, color: Colors.white24),
                            ],
                          ),
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(color: Colors.white38),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          Align(
            alignment: (widget.isLeft)
                ? AlignmentGeometry.xy(0, -0.15)
                : AlignmentGeometry.xy(0, -0.15),
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

List<RowExperienceContainer> listExperience = [
  RowExperienceContainer(
    isLeft: true,
    myIndex: 0,
    title: "FLUTTERFLOW CONSULTANT",
    subtitle: "Oct 2025 - NOW",
    description:
        "FlutterFlow & Flutter Consultant – Development of a social impact mobile application, integrating advanced business logic and custom features using Flutter custom code.",
    link: "",
    stack: "Flutter, Flutterflow, Supabase, SQLite",
    onHoverIndex: 0,
  ),

  RowExperienceContainer(
    isLeft: false,
    myIndex: 1,
    title: "CONCEPTOR & DEVELOPER FLUTTER",
    subtitle: "Oct 2025 - NOW",
    description:
        "Design and development of an integrated application for personnel management, project management, and task assignment, with interconnected modules to ensure efficient coordination and tracking.",
    link: "",
    stack: "Flutter, Supabase, SQLite",
    onHoverIndex: 1,
  ),
  RowExperienceContainer(
    isLeft: true,
    myIndex: 2,
    title: "FLUTTER & FLUTTERFLOW DEVELOPER",
    subtitle: "Freelance",
    description:
        "Development of a cross-platform chess tournament management application using FlutterFlow for prototyping and logic implementation, with extended functionalities through custom Flutter code.",
    link: "",
    stack: "Flutter, Supabase, Flutterflow, SQLite",
    onHoverIndex: 2,
  ),

  RowExperienceContainer(
    isLeft: false,
    myIndex: 3,
    title: "FLUTTER DEVELOPER",
    subtitle: "DEC 2023 - MAI 2024",
    description:
        "Development of an appointment booking application featuring three user roles (Administrator, Doctor, and Patient), enabling scheduling based on the selected doctor’s availability and calendar.",
    link: "",
    stack: "Flutter, openAPI",
    onHoverIndex: 3,
  ),
];
