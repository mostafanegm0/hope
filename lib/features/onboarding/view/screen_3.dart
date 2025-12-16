import 'package:flutter/material.dart';
import 'package:war_time/features/oflline%20mode/view/offline_mode.dart';
import 'package:war_time/core/widget/custom_button.dart';
import 'package:war_time/features/onboarding/signUpAndSignIn/sign_in.dart';
import 'package:war_time/features/onboarding/signUpAndSignIn/sign_up.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                Image.asset(
                  "assets/image/onboardingbackground.png",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    title: 'Sign in',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignIn();
                          },
                        ),
                      );
                    },
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: 'Sign up',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ),
                      );
                    },
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: 'Offline selection',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OfflineMode();
                          },
                        ),
                      );
                    },
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      fontFamily:
                          "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
