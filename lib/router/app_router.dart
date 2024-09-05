// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/helper/navigation.dart';
// import 'package:game_store/di/service_locator.dart';
// import 'package:game_store/features/home/domain/usecases/add_device_usecase.dart';
// import 'package:game_store/features/home/domain/usecases/delete_device_usecase.dart';
// import 'package:game_store/features/home/domain/usecases/get_all_device_usecase.dart';
// import 'package:game_store/features/home/domain/usecases/update_device_usecase.dart';
// import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
// import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/views/home_view.dart';
import 'package:game_store/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String kHomeViewRoute = '/homeViewRoute';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeViewRoute,
        pageBuilder: (context, state) => ScaleNavigation(
          screen: 
          // BlocProvider<DeviceBloc>(
          //   create: (context) => DeviceBloc(
          //     addDeviceUsecase: getIt.get<AddDeviceUsecase>(),
          //     deleteDeviceUsecase: getIt.get<DeleteDeviceUsecase>(),
          //     updateDeviceUsecase: getIt.get<UpdateDeviceUsecase>(),
          //     getAllDeviceUsecase: getIt.get<GetAllDeviceUsecase>(),
          //   )..add(GetAllDeviceEvent()),
          //   child:
            
             const HomeView(),
          // ),
        ),
      )
    ],
  );
}
