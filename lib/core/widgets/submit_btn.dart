import 'package:flutter/material.dart';
import 'package:game_store/core/utils/styles.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.btnColor,
      this.style,
      this.borderRadius});
  final String title;
  final void Function() onPressed;
  final Color? btnColor;
  final TextStyle? style;
  final RoundedRectangleBorder? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      child: TextButton(
        style: TextButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: btnColor ?? Theme.of(context).colorScheme.primary,
            shape: borderRadius != null
                ? borderRadius
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
        onPressed: onPressed,
        child: Text(
          title,
          style: style ??
              Styles.textStyle16.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
