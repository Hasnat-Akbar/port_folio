import 'package:flutter/material.dart';
import 'package:m_portfolio/shared/widgets/custom_button.dart';
import 'package:m_portfolio/shared/widgets/glass_container.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 40);

    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface, // Alternating background
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selected Projects",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildProjectCard(
                  context,
                  "E-Commerce App",
                  "A complete shopping app built with Flutter and Firebase. Features include user authentication, product catalog, cart management, and payment gateway integration.",
                  ["Flutter", "Firebase", "Provider", "Stripe"],
                  Colors.blueAccent,
                  "",
                  "",
                ),
                const SizedBox(width: 24),
                _buildProjectCard(
                  context,
                  "Plant Disease Detector",
                  "An AI-powered mobile app that detects plant diseases from leaf images using a custom ResNet model trained on PyTorch. Integrated via TFLite.",
                  ["Flutter", "PyTorch", "ResNet", "TFLite"],
                  Colors.greenAccent,
                  "",
                  "",
                ),
                const SizedBox(width: 24),
                _buildProjectCard(
                  context,
                  "Portfolio Website",
                  "A high-performance responsive web portfolio built with Flutter Web. Features a custom dark theme, glassmorphism UI, and animated elements.",
                  ["Flutter Web", "GoRouter", "Animate"],
                  Colors.purpleAccent,
                  "",
                  "",
                ),
                const SizedBox(width: 24),
                _buildProjectCard(
                  context,
                  "Java POS Terminal",
                  "A Point of Sale (POS) terminal application built with Java. Features include inventory management, order processing, and sales reporting.",
                  ["Java", "MySQL", "Desktop App"],
                  Colors.orangeAccent,
                  "https://github.com/Hasnat-Akbar/pos_trminal",
                  "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    List<String> tags,
    Color accentColor,
    String githubUrl,
    String liveDemo,
  ) {
    return SizedBox(
      width: 350,
      height: 450,
      child: GlassContainer(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder Image Area
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: accentColor.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[400],
                  height: 1.5,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag, style: const TextStyle(fontSize: 12)),
                      backgroundColor: accentColor.withOpacity(0.1),
                      side: BorderSide.none,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "View Code",
                    isOutlined: true,
                    onPressed: () async {
                      final url = githubUrl.trim();
                      if (url.isNotEmpty) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Source code URL not available yet!',
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    label: "Live Demo",
                    isOutlined: true,
                    onPressed: () async {
                      final url = githubUrl.trim();
                      if (url.isNotEmpty) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Source code URL not available yet!',
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
