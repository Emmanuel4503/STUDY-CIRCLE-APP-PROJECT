import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:studycycle/features/personalization/Profile/profile.dart';
import 'package:studycycle/features/cycle/circle/circle.dart';
import 'package:studycycle/features/cycle/library/library.dart';

import 'features/dashboard/screens/dashboard_screen.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: Theme.of(context).colorScheme.surface,
            indicatorColor:
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.14),
            destinations: [
              const NavigationDestination(
                  icon: Icon(Iconsax.home), label: "Dashboard"),
              const NavigationDestination(
                  icon: Icon(Iconsax.book_saved), label: "Library"),
                   const NavigationDestination(
                  icon: Icon(Iconsax.people), label: "Circle"),
                const NavigationDestination(
                  icon: Icon(Iconsax.user), label: "Profile"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    DashboardScreen(),
    const LibraryScreen(),
    const SCirclePage(),
    const ProfileScreen(),
  ];
}
