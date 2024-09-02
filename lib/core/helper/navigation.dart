import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaleNavigation extends CustomTransitionPage {
  final Widget screen;
  ScaleNavigation({required this.screen})
      : super(
            child: screen,
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, secondryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            });
}

class SlideNavigation extends CustomTransitionPage {
  final Widget screen;

  SlideNavigation({required this.screen})
      : super(
            child: screen,
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (context, animation, secondryAnimation, child) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              );

              return SlideTransition(
                position: Tween<Offset>(begin:const Offset(1, 0), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            });
}
