import 'package:flutter/material.dart';

import 'home_widgets/grid_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 450,
              width: 440,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/onboardingbackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 40,
              left: 20,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/image/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "H.O.P.E",
                    style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 256,
                  height: 64,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Need Help ?",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 290,
              left: 0,
              right: 0,
              child: ClipPath(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: GridMenu(),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }



  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

