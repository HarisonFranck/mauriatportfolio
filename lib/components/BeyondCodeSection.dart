import 'package:flutter/material.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';

class BeyondCodeSection extends StatelessWidget {
  const BeyondCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 800;

    return Padding(
      padding: EdgeInsets.only(left: 190,right:190),
      child:Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(54, 18, 25, 52), // Match the dark card look
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Section Title
          Text(
            l10n.beyondCodeTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          // Section Description
          SizedBox(
            width: 800, // max width for text readability
            child: Text(
              l10n.beyondCodeDesc,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),

          // Features (Responsive Row or Column)
          if (isMobile)
            Column(
              spacing: 40,
              children: [
                _buildFeatureItem(
                  icon: Icons.track_changes_outlined,
                  title: l10n.beyondCodeStrategicTitle,
                  description: l10n.beyondCodeStrategicDesc,
                ),
                _buildFeatureItem(
                  icon: Icons.lightbulb_outline,
                  title: l10n.beyondCodeProductTitle,
                  description: l10n.beyondCodeProductDesc,
                ),
                _buildFeatureItem(
                  icon: Icons.people_outline,
                  title: l10n.beyondCodeCollaborativeTitle,
                  description: l10n.beyondCodeCollaborativeDesc,
                ),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildFeatureItem(
                    icon: Icons.track_changes_outlined,
                    title: l10n.beyondCodeStrategicTitle,
                    description: l10n.beyondCodeStrategicDesc,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: _buildFeatureItem(
                    icon: Icons.lightbulb_outline,
                    title: l10n.beyondCodeProductTitle,
                    description: l10n.beyondCodeProductDesc,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: _buildFeatureItem(
                    icon: Icons.people_outline,
                    title: l10n.beyondCodeCollaborativeTitle,
                    description: l10n.beyondCodeCollaborativeDesc,
                  ),
                ),
              ],
            ),
        ],
      ),
    ));
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        // Glowing Icon Container
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(30, 45, 146, 166), // Subtle background
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 45, 146, 166).withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 29, 171, 196), // Cyan icon color
            size: 30,
          ),
        ),
        const SizedBox(height: 20),
        // Title
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        // Description
        Text(
          description,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 14,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
