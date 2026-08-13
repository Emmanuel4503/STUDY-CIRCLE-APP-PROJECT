import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/icons.dart';
import 'package:studycycle/utils/widgets/custom_card.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,

    required this.title,
    required this.members,
    required this.joined,
    required this.buttonText,
    this.onPressed,
  });

  final String title;
  final dynamic members;
  final bool joined;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(SIcons.groups, color:SColors.primaryLight ,)),
        title: Text(title),
        subtitle: Text(members),
        trailing: ElevatedButton(onPressed: () {},
        style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFF2E7D32))),
         child: Text(buttonText, style:const TextStyle(color: Colors.white) ,),
         ),
      ),
    );
  }
}
