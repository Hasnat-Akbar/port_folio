import 'package:flutter/material.dart';
import 'package:m_portfolio/features/about/presentation/widgets/about_section.dart';
import 'package:m_portfolio/features/contact/presentation/widgets/contact_section.dart';
import 'package:m_portfolio/features/intro/hero_section.dart';
import 'package:m_portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:m_portfolio/features/skills/presentation/widgets/skills_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey projectsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(
              onViewWork: () {
                Scrollable.ensureVisible(
                  projectsKey.currentContext!,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              },
            ),
            const AboutSection(),
            const SkillsSection(),
            ProjectsSection(key: projectsKey),
            const ContactSection(),
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }
}
