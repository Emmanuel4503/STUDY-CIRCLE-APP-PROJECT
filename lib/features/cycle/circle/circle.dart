import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/icons.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';
import 'package:studycycle/utils/widgets/filter_list.dart';
import 'package:studycycle/utils/widgets/study_group_card.dart';

void main() {
  runApp(const SCirclePage());
}

class SCirclePage extends StatelessWidget {
  const SCirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudyCirclePage(),
    );
  }
}

class StudyCirclePage extends StatelessWidget {
  const StudyCirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Circle",
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSpacing.screenPadding),
        child: Column(
          children: [
            // Search Bar and Filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search study groups...",
                      prefixIcon: const Icon(SIcons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: SSpacing.sm),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const FilterList();
                      },
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: SSpacing.lg),

            Expanded(
              child: ListView(
                children: [
                  const Text(
                    "Groups Joined",
                    style: TextStyle(
                        fontSize: SSizes.fontLg, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSpacing.sm),
                  GroupCard(
                    title: "Philosophy",
                    members: "12 members",
                    buttonText: "Open",
                    joined: true,
                    onPressed: () => (),
                  ),
                  
                  GroupCard(
                    title: "Flutter Developer",
                    members: "15 members",
                    buttonText: "Open",
                    joined: true,
                    onPressed: () => (),
                  ),
                  GroupCard(
                    title: "Law",
                    members: "15 members",
                    buttonText: "Open",
                    joined: true,
                    onPressed: () => (),
                  ),

                  const SizedBox(height: SSpacing.lg),
                  const Text(
                    "Groups Available",
                    style: TextStyle(
                        fontSize: SSizes.fontLg, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSpacing.sm),
                  GroupCard(
                    title: "Mathematics 101",
                    members: "40 members",
                    buttonText: "join",
                    joined: false,
                    onPressed: () => (),
                  ),

                  GroupCard(
                    title: "Chemistry Revision",
                    members: "30 members",
                    buttonText: "Join",
                    joined: false,
                    onPressed: () => (),
                  ),
                  GroupCard(
                    title: "Computer Science",
                    members: "18 members",
                    buttonText: "Join",
                    joined: false,
                    onPressed: () => (),
                  ),
                  GroupCard(
                    title: "Eco-Math 102",
                    members: "7 members",
                    buttonText: "Join",
                    joined: false,
                    onPressed: () => (),
                  ),
                  GroupCard(
                    title: "History 001",
                    members: "12 members",
                    buttonText: "Join",
                    joined: false,
                    onPressed: () => (),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
