import 'package:flutter/material.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:quickalert/quickalert.dart';

buildQuickAlret(BuildContext context, QuickAlertType quickAlertType,
    String text, String title) {
  return QuickAlert.show(
    context: context,
    barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    barrierDismissible: true,
    type: quickAlertType,
    text: text,
    title: title,
    textColor: Theme.of(context).colorScheme.onBackground,
    animType: QuickAlertAnimType.scale,
    titleColor: Theme.of(context).colorScheme.onBackground,
    backgroundColor: Theme.of(context).colorScheme.background,
    confirmBtnColor:
        quickAlertType == QuickAlertType.error ? Colors.red : Colors.green,
    confirmBtnTextStyle: Styles.textStyle16.copyWith(
      color: Theme.of(context).colorScheme.background,
      fontFamily: "Robo",
    ),
  );
}
