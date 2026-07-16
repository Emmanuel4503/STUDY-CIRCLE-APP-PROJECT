import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/cycle/controllers/dashboard/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Dashboard Screen',
        ),
      ),
    );
  }
}