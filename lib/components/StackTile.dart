import 'package:flutter/material.dart';

class StackTile extends StatelessWidget {
  StackTile({required this.stackName, required this.sectionId});

  String stackName;
  int sectionId;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              stackName,
              style: TextStyle(
                letterSpacing: 1.2,
                color: const Color.fromARGB(108, 255, 255, 255),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<StackTile> stackTiles = [
  StackTile(sectionId: 0, stackName: "Flutter"),
  StackTile(sectionId: 0, stackName: "Flutterflow"),
  StackTile(sectionId: 0, stackName: "Javascript"),
  StackTile(sectionId: 1, stackName: "Supabase / Firebase"),
  StackTile(sectionId: 1, stackName: "Xano"),
  StackTile(sectionId: 1, stackName: "Cloud Functions"),
  StackTile(sectionId: 1, stackName: "SQLite"),
  StackTile(sectionId: 1, stackName: "PostgreSQL"),
  StackTile(sectionId: 2, stackName: "Git"),
  StackTile(sectionId: 2, stackName: "CI/CD"),
  StackTile(sectionId: 2, stackName: "Adobe XD"),
  StackTile(sectionId: 2, stackName: "Vs Code"),
  StackTile(sectionId: 2, stackName: "Xcode / Android Studio"),
  StackTile(sectionId: 3, stackName: "Clean Architecture"),
  StackTile(sectionId: 3, stackName: "Gestion d'état"),
  StackTile(sectionId: 3, stackName: "API Rest"),
];
