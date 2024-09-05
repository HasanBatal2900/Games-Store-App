import 'package:audioplayers/audioplayers.dart';
import 'package:game_store/features/home/data/datasource/local_datasource.dart';
import 'package:game_store/features/home/data/repos/home_repo_imp.dart';
import 'package:game_store/features/home/domain/usecases/add_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/delete_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/get_all_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/update_device_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setup() async {
  getIt.registerSingleton<AudioPlayer>(AudioPlayer());
  getIt.registerSingleton<LocalDataSourceImp>(LocalDataSourceImp());
  getIt.registerSingleton<HomeRepoImp>(
      HomeRepoImp(localDataSourceImp: getIt.get<LocalDataSourceImp>()));
  getIt.registerSingleton<AddDeviceUsecase>(
      AddDeviceUsecase(homRepo: getIt.get<HomeRepoImp>()));
  getIt.registerSingleton<DeleteDeviceUsecase>(
      DeleteDeviceUsecase(homRepo: getIt.get<HomeRepoImp>()));

  getIt.registerSingleton<UpdateDeviceUsecase>(
      UpdateDeviceUsecase(homRepo: getIt.get<HomeRepoImp>()));
  getIt.registerSingleton<GetAllDeviceUsecase>(
      GetAllDeviceUsecase(homRepo: getIt.get<HomeRepoImp>()));
}
