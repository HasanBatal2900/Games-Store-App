import 'package:flutter/material.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

buildAlretPriceDialog(
    BuildContext context, String userName, double totalPrice) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              width: MediaQuery.sizeOf(context).width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$userName's price",
                    style: Styles.textStyle24.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Robo",
                    ),
                  ),
                  Text(
                    "total price is : $totalPrice",
                    style: Styles.textStyle16.copyWith(
                      fontFamily: "Poppins-reg",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Text("Okey"))
            ],
          ));
}
