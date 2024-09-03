import 'package:flutter/material.dart';
import 'package:game_store/core/helper/modals/build_add_modal_bottom.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildAddDeviceModalBottom(context);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
