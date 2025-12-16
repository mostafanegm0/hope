import 'package:flutter/material.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _menuCard(
                icon: Icons.home,
                title: 'Safe Places and Shelters',
                subtitle: 'Find the nearest shelter',
              ),
              _menuCard(
                icon: Icons.volunteer_activism,
                title: 'Volunteers',
                subtitle: 'Apply for assistance',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _menuCard(
                icon: Icons.info_outline,
                title: 'Resources and guidance',
                subtitle: 'First aid, tips & more',
              ),
              _menuCard(
                icon: Icons.wifi_off,
                title: 'Offline Selection',
                subtitle: 'Use mesh topology',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuCard({required IconData icon, required String title, required String subtitle}) {
    return Container(
      height: 160,
      width: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5, offset: const Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }

}
