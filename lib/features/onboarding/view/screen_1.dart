import 'package:flutter/material.dart';
import 'package:war_time/features/onboarding/view/screen_2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    // مدة ظهور الصفحة أطول: ننتظر 2.5 ثانية قبل fade out
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        _opacity = 0.0; // بدء fade out
      });

      // بعد انتهاء fade out، ننتقل للصفحة الثانية
      Future.delayed(const Duration(milliseconds: 800), () {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Screen2(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  // fade سلس بين الصفحتين
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                    child: child,
                  );
                },
            transitionDuration: const Duration(milliseconds: 800), // أطول
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: _opacity,
        curve: Curves.easeOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/image/onboardingbackground.png',
              width: size.width,
              height: size.height * 0.6,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                textAlign: TextAlign.start,
                "Welcome",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Lorem ipsum dolor sit amet consectetur. Lorem id sit",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff5d5d5d),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily:
                      "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
