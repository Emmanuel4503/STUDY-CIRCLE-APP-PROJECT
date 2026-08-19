import 'package:flutter/material.dart';

import '../constants/sizes.dart';

/// A consistent app bar wrapper.
///
/// Implements [PreferredSizeWidget] so it can be dropped straight into
/// `Scaffold(appBar: CustomAppBar(...))`. Inherits colors from `AppBarTheme`.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBack;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBack = true,
    this.onBack, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: showBack,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(SSizes.appBarHeight);
}
