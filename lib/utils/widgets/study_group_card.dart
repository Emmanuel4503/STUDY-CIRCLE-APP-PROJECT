import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/icons.dart';
import 'package:studycycle/utils/widgets/custom_card.dart';

class SGroup extends StatelessWidget {
  const SGroup({
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
        leading: const CircleAvatar(child: Icon(SIcons.groups)),
        title: Text(title),
        subtitle: const Text(''),
        trailing: ElevatedButton(
            onPressed: onPressed ?? () {},
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(SColors.primary)),
            child: Text(buttonText)),
      ),
    );
  }
}
