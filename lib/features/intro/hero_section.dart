import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m_portfolio/shared/widgets/custom_button.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWork;

  const HeroSection({super.key, required this.onViewWork});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: _buildMobileLayout(context),
      desktopBody: _buildDesktopLayout(context),
    );
  }

  bool isLoading = false;

  Future<void> openResume() async {
    setState(() {
      isLoading = true;
    });
    final Uri url = Uri.parse(
      'https://github.com/Hasnat-Akbar/port_folio/raw/main/Hasnat_Akbar_Resume.pdf',
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Opening resume...")));

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch resume");
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "👋 Hi, I'm Hasnat.",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 135, // Fixed height to prevent layout shift
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Building Cross-Platform Apps\n& Intelligent Models.",
                        textStyle: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Flutter Developer | Machine Learning Enthusiast",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.grey[400]),
                ).animate(delay: 1000.ms).fadeIn().slideY(begin: 0.2, end: 0),
                const SizedBox(height: 40),
                Row(
                  children: [
                    CustomButton(
                      label: isLoading ? 'opening' : "Download Resume",
                      icon: isLoading ? null : FontAwesomeIcons.download,
                      onPressed: isLoading ? null : openResume,
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      label: "View Work",
                      isOutlined: true,
                      onPressed: widget.onViewWork,
                    ),
                  ],
                ).animate(delay: 1200.ms).fadeIn().slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
          // Right side decoration (abstract or image)
          Expanded(
            child: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    ],
                  ),
                ),
                child:
                    Icon(
                          FontAwesomeIcons.robot,
                          size: 150,
                          color: Theme.of(context).colorScheme.primary,
                        )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                          duration: 2000.ms,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
              ),
            ).animate(delay: 600.ms).scale(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "👋 Hi, I'm Hasnat.",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Building Cross-Platform Apps & Intelligent Models",
                  textStyle: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Flutter Developer | Machine Learning Enthusiast",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[400]),
          ).animate(delay: 1000.ms).fadeIn(),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: isLoading ? 'opening' : "Download Resume",
                icon: isLoading ? null : FontAwesomeIcons.download,
                onPressed: isLoading ? null : openResume,
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "View Work",
                isOutlined: true,
                onPressed: widget.onViewWork,
              ),
            ],
          ).animate(delay: 1200.ms).fadeIn().slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}
