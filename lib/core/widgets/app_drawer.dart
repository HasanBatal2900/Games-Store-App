import 'package:flutter/material.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/core/widgets/change_btn_theme.dart';
import 'package:gap/gap.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
      )),
      backgroundColor: Theme.of(context).colorScheme.background,
      semanticLabel: "Your Settings",
      width: MediaQuery.sizeOf(context).width * .8,
      elevation: 6.0,
      child: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Settings",
                  style: Styles.textStyle20.copyWith(
                    fontFamily: "Robo",
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const ChangeThemeButtonIcon(),
              ],
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .8,
              height: 10,
              child: const Divider(thickness: 2),
            ),
            const Gap(20),
            Text(
              "The Langague",
              style: Styles.textStyle16.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontFamily: "Robo",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
