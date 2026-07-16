import 'package:flutter/material.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_header.dart';
import 'package:studycycle/features/dashboard/widgets/progress_overview.dart';
import 'package:studycycle/features/dashboard/widgets/quick_actions.dart';
import 'package:studycycle/features/dashboard/widgets/recommended_resources.dart';
import 'package:studycycle/features/dashboard/widgets/upcoming_sessions.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DashboardHeader(),

            Padding(
              padding: EdgeInsets.all(24),
              child: QuickActions(),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: UpcomingSessions(),
            ),

            Padding(
              padding: EdgeInsets.all(24),
              child: ProgressOverview(),
            ),

            Padding(
              padding: EdgeInsets.all(24), 
              child: RecommendedResources()
              ),
          ],
        ),
      ),
    );
  }
}