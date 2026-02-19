import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mauriatportfolio/Utilities/Utilitie.dart';

// ignore: must_be_immutable
class ProjectCard extends StatefulWidget {
  ProjectCard({
    required this.myIndex,
    required this.title,
    required this.description,
    required this.pathImage,
    required this.link,
    required this.stackNames,
  });
  int myIndex;
  String pathImage;
  String title;
  String description;
  List<String> stackNames;
  String link;
  int projectHoverIndex = 100;
  String basePath = "assets/images/";

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        print("${widget.myIndex}");
        setState(() {
          widget.projectHoverIndex = widget.myIndex;
        });
      },
      onExit: (event) {
        setState(() {
          widget.projectHoverIndex = 100;
        });
      },
      child: Container(
        width: 550,
        height: 530,
        decoration: BoxDecoration(
          color: const Color.fromARGB(54, 96, 109, 139),
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          "${widget.basePath}${widget.pathImage}",
                        ),
                        fit: (widget.myIndex == 2)
                            ? BoxFit.contain
                            : BoxFit.cover,
                      ),
                    ),
                  ),
                  if (widget.projectHoverIndex == widget.myIndex)
                    InkWell(
                      onTap: () {
                        if (widget.link != "") {
                          Utilitie().urlLaunch(widget.link);
                        }
                      },
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            width: double.infinity,
                            height: 350,

                            child: Center(
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.open_in_new, size: 40),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 10,
                ),
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      child: Text(
                        overflow: TextOverflow.fade,
                        widget.description,
                        style: TextStyle(color: Colors.white38),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < widget.stackNames.length; i++) ...[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 63, 60, 159),
                              ),
                              color: const Color.fromARGB(142, 21, 20, 59),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Center(
                                child: Text(
                                  widget.stackNames[i],
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      113,
                                      111,
                                      200,
                                    ),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<ProjectCard> projects = [
  ProjectCard(
    myIndex: 0,
    title: "An appointment booking app",
    description:
        "Medical appointment platform allowing patients to search for doctors, view real-time availability, and book appointments, with centralized administrative management.",
    pathImage: "MedScheduler.png",
    link: "https://github.com/HarisonFranck/Med-Scheduler-Front.git",
    stackNames: ["Flutter", "Adobe XD", "REST API", "OpenAPI"],
  ),

  ProjectCard(
    myIndex: 1,
    title: "Eisen Task",
    description:
        "An app for personnel management, project management, and task assignment, with interconnected modules to ensure efficient coordination and tracking.",
    pathImage: "EisenTask.png",
    link: "https://github.com/HarisonFranck/EisenTask.git",
    stackNames: ["Flutter", "Xano"],
  ),
  ProjectCard(
    myIndex: 2,
    title: "Tech-Innov : personnel management App",
    description:
        "Development of a personnel management interface using Flutter, featuring an interactive dashboard and real-time visualization of active employees.",
    pathImage: "Responsive.png",
    link: "https://github.com/HarisonFranck/TeamTech.git",
    stackNames: ["Flutter"],
  ),
  ProjectCard(
    myIndex: 2,
    title: "Lyrics App for a choir",
    description:
        "Development of a gospel song lyrics search application for a choir, centralizing lyrics within a single platform and enabling synchronization with the organization’s online server.",
    pathImage: "ShalomApp.png",
    link: "https://github.com/HarisonFranck/Shalom-App.git",
    stackNames: ["Flutter", "Supabase", "SQLite"],
  ),
];
