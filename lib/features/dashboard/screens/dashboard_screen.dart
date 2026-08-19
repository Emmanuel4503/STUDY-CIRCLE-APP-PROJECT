import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/dashboard/controllers/dashboard_controller.dart';
import 'package:studycycle/features/dashboard/widgets/active_groups.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_header.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_search_bar.dart';
import 'package:studycycle/features/dashboard/widgets/progress_overview.dart';
import 'package:studycycle/features/dashboard/widgets/quick_actions.dart';
import 'package:studycycle/features/dashboard/widgets/recent_activity.dart';
import 'package:studycycle/features/dashboard/widgets/recommended_resources.dart';
import 'package:studycycle/features/dashboard/widgets/upcoming_sessions.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DashboardHeader(),

            const SizedBox(height: SSizes.md),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: DashboardSearchBar(),
            ),

            const SizedBox(height: SSizes.lg),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: QuickActions(),
            ),

            const SizedBox(height: SSizes.lg),

            // Active Groups
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: ActiveGroups(),
            ),

            const SizedBox(height: SSizes.lg),

            // Upcoming Sessions comes before Progress Overview
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: UpcomingSessions(),
            ),

            const SizedBox(height: SSizes.lg),

            // Progress Overview
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: ProgressOverview(),
            ),

            const SizedBox(height: SSizes.lg),

            // Recommended Resources
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: RecommendedResources(),
            ),

            const SizedBox(height: SSizes.lg),

            // Recent Activity
            Padding(
              padding: const EdgeInsets.fromLTRB(
                SSizes.lg,
                0,
                SSizes.lg,
                SSizes.lg,
              ),
              child: RecentActivity(),
            ),
          ],
        ),
      ),
    );
  }
}