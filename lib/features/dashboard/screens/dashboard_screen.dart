import 'package:flutter/material.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_header.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_search_bar.dart';
import 'package:studycycle/features/dashboard/widgets/progress_overview.dart';
import 'package:studycycle/features/dashboard/widgets/quick_actions.dart';
import 'package:studycycle/features/dashboard/widgets/recent_activity.dart';
import 'package:studycycle/features/dashboard/widgets/recommended_resources.dart';
import 'package:studycycle/features/dashboard/widgets/upcoming_sessions.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: UpcomingSessions(),
            ),

            const SizedBox(height: SSizes.lg),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: ProgressOverview(),
            ),

            const SizedBox(height: SSizes.lg),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
              child: RecommendedResources(),
            ),

            const SizedBox(height: SSizes.lg),

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