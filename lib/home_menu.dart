import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome to Library App')),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.book), label: 'Books'),
        ],
      ),
    );
  }
}
