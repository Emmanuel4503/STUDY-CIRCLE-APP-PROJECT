import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/assessments_tab.dart';
import 'package:studycycle/features/class_room/exams_tab.dart';
import 'package:studycycle/features/class_room/voting_polls_tab.dart';
import 'package:studycycle/utils/constants/colors.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs: Assessments, Exams, Voting
      child: Scaffold(
        // --- Custom App Bar containing TabBar controls ---
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('My Classroom',
              style: Theme.of(context).textTheme.headlineSmall),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.filter_search_copy),
            ),
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: SColors.darkGrey,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Assessments'),
              Tab(text: 'Exams'),
              Tab(text: 'Voting/Polls'),
            ],
          ),
        ),

        // --- Core Sub-screen Views ---
        body: const TabBarView(
          children: [
            // 1. ASSESSMENTS TAB VIEW PANEL
            AssessmentsTab(),

            // 2. EXAMINATIONS TAB VIEW PANEL
            ExamsTab(),

            // 3. VOTING & POLLS TAB VIEW PANEL
            VotingPollsTab(),
          ],
        ),
      ),
    );
  }
}
