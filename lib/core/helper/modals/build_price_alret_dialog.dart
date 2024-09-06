import 'package:flutter/material.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

buildAlretDialog(BuildContext context, String title, String subTitle) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.sizeOf(context).height * .13,
              width: MediaQuery.sizeOf(context).width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Theme.of(context).colorScheme.error,
                        size: 20,
                      ),
                      Text(
                        title,
                        style: Styles.textStyle24.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Robo",
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    subTitle,
                    style: Styles.textStyle16.copyWith(
                      fontFamily: "Poppins-reg",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    "Okey",
                    style: Styles.textStyle16.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Robo",
                    ),
                  ))
            ],
          ));
}
