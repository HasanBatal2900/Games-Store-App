import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CustomAnimatedRefersh extends StatelessWidget {
  const CustomAnimatedRefersh(
      {super.key,
      required this.child,
      required this.onRefersh,
      this.showChildren = false});
  final Widget child;
  final Future<void> Function() onRefersh;
  final bool showChildren;
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        onRefresh: onRefersh,
        springAnimationDurationInMilliseconds: 800,
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Theme.of(context).colorScheme.primary,
        height: 200,
        showChildOpacityTransition: showChildren,
        child: child);
  }
}
