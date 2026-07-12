import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: SColors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Icon(
            Icons.auto_stories_rounded,
            size: 60,
            color: SColors.primary,
          ),
        ),
      ),
    );
  }
}
