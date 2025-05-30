import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBody extends StatelessWidget {
  const MainBody({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event Feed',
          ),
        ],
      ),
    );
  }
}
//AIzaSyAOVYRIgupAurZup5y1PRh8Ismb1A3lLao