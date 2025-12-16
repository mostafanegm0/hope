import 'package:flutter/material.dart';
import 'package:war_time/features/oflline%20mode/view/widget/blur.dart';
import 'package:war_time/core/widget/custom_button.dart';

class OfflineMode extends StatelessWidget {
  const OfflineMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SafeArea(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
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

                      IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          _showBlurOverlay(
                            context,
                            title1: "Change display name",
                            onPressed1: () {},
                            title2: "Link Devices",
                            onPressed2: () {
                              _showBlurOverlay(
                                context,
                                title1: "Scan QR Code",
                                onPressed1: () {},
                                title2: "Genarate QR Code",
                                onPressed2: () {},
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/image/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  CustomButton(
                    title: "Discover",
                    onPressed: () {},
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      fontFamily:
                          "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.send_sharp),
                      suffixIconColor: Colors.black,
                      hintText: "Type a message",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily:
                            "assets/font/sf-pro-display/SFPRODISPLAYREGULAR.OTF",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void _showBlurOverlay(
  BuildContext context, {
  required String title1  ,
  required void Function() onPressed1,
  required String title2,
  required void Function() onPressed2,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withValues(alpha: 0.3),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return BlurOverlayScreen(
        title1: title1,
        onPressed1: onPressed1,
        title2: title2,
        onPressed2: onPressed2,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
