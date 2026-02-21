import 'package:flutter/material.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';

class StackTile extends StatelessWidget {
  StackTile({required this.stackKey, required this.sectionId});

  /// `stackKey` should match the localization key (e.g. 'stack_flutter')
  String stackKey;
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
              localizedStackName(context, stackKey),
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
  StackTile(sectionId: 0, stackKey: "stack_flutter"),
  StackTile(sectionId: 0, stackKey: "stack_flutterflow"),
  StackTile(sectionId: 0, stackKey: "stack_javascript"),
  StackTile(sectionId: 0, stackKey: "stack_angular"),
  StackTile(sectionId: 1, stackKey: "stack_supabase"),
  StackTile(sectionId: 1, stackKey: "stack_xano"),
  StackTile(sectionId: 1, stackKey: "stack_cloud_functions"),
  StackTile(sectionId: 1, stackKey: "stack_sqlite"),
  StackTile(sectionId: 1, stackKey: "stack_postgresql"),
  StackTile(sectionId: 2, stackKey: "stack_git"),
  StackTile(sectionId: 2, stackKey: "stack_cicd"),
  StackTile(sectionId: 2, stackKey: "stack_adobexd"),
  StackTile(sectionId: 2, stackKey: "stack_vscode"),
  StackTile(sectionId: 2, stackKey: "stack_xcode_android"),
  StackTile(sectionId: 3, stackKey: "stack_clean_architecture"),
  StackTile(sectionId: 3, stackKey: "stack_state_management"),
  StackTile(sectionId: 3, stackKey: "stack_api_rest"),
];

String localizedStackName(BuildContext context, String key) {
  final l10n = AppLocalizations.of(context)!;
  switch (key) {
    case 'stack_flutter':
      return l10n.stack_flutter;
    case 'stack_flutterflow':
      return l10n.stack_flutterflow;
    case 'stack_javascript':
      return l10n.stack_javascript;
    case 'stack_angular':
      return l10n.stack_angular;
    case 'stack_supabase':
      return l10n.stack_supabase;
    case 'stack_xano':
      return l10n.stack_xano;
    case 'stack_cloud_functions':
      return l10n.stack_cloud_functions;
    case 'stack_sqlite':
      return l10n.stack_sqlite;
    case 'stack_postgresql':
      return l10n.stack_postgresql;
    case 'stack_git':
      return l10n.stack_git;
    case 'stack_cicd':
      return l10n.stack_cicd;
    case 'stack_adobexd':
      return l10n.stack_adobexd;
    case 'stack_vscode':
      return l10n.stack_vscode;
    case 'stack_xcode_android':
      return l10n.stack_xcode_android;
    case 'stack_clean_architecture':
      return l10n.stack_clean_architecture;
    case 'stack_state_management':
      return l10n.stack_state_management;
    case 'stack_api_rest':
      return l10n.stack_api_rest;
    default:
      return key;
  }
}
