import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m_portfolio/shared/widgets/glass_container.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 40);

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills Dashboard",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    "Mobile Development",
                    Icons.install_mobile,
                    ["Flutter", "Dart", "Firebase", "State Management"],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    "AI & Machine Learning",
                    FontAwesomeIcons.brain,
                    [
                      "Python",
                      "TensorFlow",
                      "PyTorch",
                      "Model Training",
                      "Jupyter",
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    "Backend & Legacy",
                    Icons.storage,
                    ["Java", "SQL", "REST APIs", "Git"],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildSkillCategory(
                  context,
                  "Mobile Development",
                  Icons.install_mobile,
                  ["Flutter", "Dart", "Firebase", "State Management"],
                ),
                const SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "AI & Machine Learning",
                  FontAwesomeIcons.brain,
                  [
                    "Python",
                    "TensorFlow",
                    "PyTorch",
                    "Model Training",
                    "Jupyter",
                  ],
                ),
                const SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Backend & Legacy",
                  Icons.storage,
                  ["Java", "SQL", "REST APIs", "Git"],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    IconData icon,
    List<String> skills,
  ) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.secondary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    side: BorderSide(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.3),
                    ),
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
