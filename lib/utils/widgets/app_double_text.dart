import 'package:flutter/material.dart';


class AppDoubleText extends StatelessWidget {
  const AppDoubleText({super.key, required this.bigText, this.func, required this.smallText});
  final String bigText;
  final String smallText;
  final VoidCallback? func;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(bigText, style: Theme.of(context).textTheme.headlineSmall),
      InkWell(
          onTap: func,
          child: Text(smallText, style: Theme.of(context).textTheme.bodySmall),
        )
    ],);
  }
}