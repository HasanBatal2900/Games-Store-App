import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_store/core/constants/keys.dart';
import 'package:game_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:game_store/di/service_locator.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/usecases/add_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/delete_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/get_all_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/update_device_usecase.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/generated/l10n.dart';
import 'package:game_store/l10n/lang_cubit/lang_cubit.dart';
import 'package:game_store/router/app_router.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceEntityAdapter());
  await Hive.openBox<DeviceEntity>(kDeviceKeyBox);
  await setup();
  runApp(const GameStoreApp());
}

class GameStoreApp extends StatelessWidget {
  const GameStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeviceBloc(
            addDeviceUsecase: getIt.get<AddDeviceUsecase>(),
            deleteDeviceUsecase: getIt.get<DeleteDeviceUsecase>(),
            updateDeviceUsecase: getIt.get<UpdateDeviceUsecase>(),
            getAllDeviceUsecase: getIt.get<GetAllDeviceUsecase>(),
          )..add(GetAllDeviceEvent()),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LangagueCubit(),
        ),
      ],
      child: BlocBuilder<LangagueCubit, String>(
        builder: (context, state) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, state) {
              return MaterialApp.router(
                locale:
                    Locale(BlocProvider.of<LangagueCubit>(context).getLang()),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: BlocProvider.of<ThemeCubit>(context).getTheme(),
              );
            },
          );
        },
      ),
    );
  }
}
