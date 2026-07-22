import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/spacing.dart';
import 'package:studycycle/utils/widgets/bottom_sheet.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';
import 'package:studycycle/utils/widgets/study_group_card.dart';
import '../../../utils/widgets/filter_list.dart';

class SCircleScreen extends StatelessWidget {
  const SCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Circle'),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(SSpacing.screenPadding),
        child: Column(
          children: [
            //search bar and filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'search study groups...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: SSpacing.md),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    AppBottomSheet.show(
                      child: const FilterList(),
                      isScrollControlled: true
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSpacing.sm),
                  const SGroup(
                    title: "Philosophy",
                    members: "28 Members",
                    buttonText: "Open",
                    joined: true,
                  ),
                  const SGroup(
                    title: "Law",
                    members: "15 Members",
                    buttonText: "Open",
                    joined: true,
                  ),
                  const SizedBox(height: SSpacing.lg),
                  const Text(
                    "Groups Available",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height:SSpacing.md ),
                  const SGroup(
                    title: "Mathematics 101",
                    members: "40 Members",
                    buttonText: "Join",
                    joined: false,
                  ),
              
                  const SGroup(
                    title: "Chemistry Revision",
                    members: "22 Members",
                    buttonText: "Join",
                    joined: false,
                  ),
                 
                  const SGroup(
                    title: "Computer Science",
                    members: "18 Members",
                    buttonText: "Join",
                    joined: false,
                  ),
           
                  const SGroup(
                    title: "Eco-Math 102",
                    members: "18 Members",
                    buttonText: "Join",
                    joined: false,
                  ),
                
                  const SGroup(
                    title: "History 001",
                    members: "18 Members",
                    buttonText: "Join",
                    joined: false,
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
