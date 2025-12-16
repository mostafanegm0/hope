import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:war_time/core/widget/custom_button.dart';

class BlurOverlayScreen extends StatelessWidget {
  const BlurOverlayScreen({
    super.key,
    required this.title1,
    required this.onPressed1,
    required this.title2,
    required this.onPressed2,
  });
  final String title1;
  final void Function() onPressed1;
  final String title2;
  final void Function() onPressed2;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withValues(alpha: 0.3),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Content card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(
                          title: title1,
                          onPressed: onPressed1,
                          style: TextStyle(
                            fontFamily:
                                "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          title: title2,
                          onPressed: onPressed2,
                          style: TextStyle(
                            fontFamily:
                                "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
