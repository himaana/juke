import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juke/controller/navbar_controller.dart';
import 'package:juke/screens/screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomeScreen(),
            LibraryScreen(),
            SearchScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            backgroundColor: Color(0xFF151A22),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.red,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle),
                label: 'Listen Now',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
        ),
      );
    });
  }
}
