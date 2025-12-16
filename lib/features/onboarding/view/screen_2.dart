import 'package:flutter/material.dart';
import 'package:war_time/features/onboarding/view/screen_3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnim;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _heightAnim = Tween<double>(
      begin: 0.8,
      end: 0.6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

    // fade in content
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() => _opacity = 1);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmall = screenHeight < 700;

    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 600),
        child: Column(
          children: [
            /// Background Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return SizedBox(
                  height: screenHeight * _heightAnim.value,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/image/onboardingbackground.png',
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),

            /// Logo مع مساحة أكبر
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(
                  "assets/image/logo.png",
                  width: isSmall ? 200 : 280,
                ),
              ),
            ),

            const Spacer(),

            /// Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const Screen3()),
                      );
                    },
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
