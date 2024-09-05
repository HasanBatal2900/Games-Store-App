import 'package:flutter/material.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/theme/themes.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/router/app_router.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  runApp(const GameStoreApp());
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceEntityAdapter());
  await Hive.openBox(kDeviceKeyBox);
}

class GameStoreApp extends StatelessWidget {
  const GameStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: lightTheme,
    );
  }
}
