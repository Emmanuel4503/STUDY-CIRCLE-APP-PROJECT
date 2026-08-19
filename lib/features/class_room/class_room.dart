import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/assessments_tab.dart';
import 'package:studycycle/features/class_room/exams_tab.dart';
import 'package:studycycle/features/class_room/voting_polls_tab.dart';
import 'package:studycycle/features/class_room/chat_room_tab.dart'; // New feature tab
import 'package:studycycle/utils/constants/colors.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: SColors.lighterBackground,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Stack(
            children: [
              // Outline Text effect using dual paint layers
              Text(
                'My Classroom',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = primaryColor.withValues(alpha: 0.15),
                    ),
              ),
              Text(
                'My Classroom',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      color: primaryColor,
                    ),
              ),
            ],
          ),
          actions: [
            // Styled action button container with soft drop shadow
            Container(
              //margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.filter_search_copy,
                    color: primaryColor, size: 20),
              ),
            ),
          ],

          // --- Tab Bar
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: SColors.darkGrey,
                indicatorSize: TabBarIndicatorSize.tab,

                // Extra styling for selected tab
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      primaryColor.withValues(alpha: 0.85)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                // Extra micro-padding for the tabs
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                tabs: const [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Iconsax.message_text_1_copy, size: 16),
                        SizedBox(width: 6),
                        Text('Chatroom',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Iconsax.task_square_copy, size: 16),
                        SizedBox(width: 6),
                        Text('Assessments',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Iconsax.document_text_copy, size: 16),
                        SizedBox(width: 6),
                        Text('Exams',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Iconsax.status_up_copy, size: 16),
                        SizedBox(width: 6),
                        Text('Voting/Polls',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // --- Core Sub-screen Views Layout ---
        body: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: TabBarView(
            children: [
              // LIVE CHATROOM TAB PANEL
              ChatroomTab(),

              // ASSESSMENTS Tab View Panel
              AssessmentsTab(),

              // EXAMINATIONS Tab View Panel
              ExamsTab(),

              // VOTING & POLLS Tab View Panel
              VotingPollsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
