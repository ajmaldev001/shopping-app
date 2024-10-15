import 'package:get_it/get_it.dart';
import 'package:shopping_app/data/network/network_api_service.dart';
import 'package:shopping_app/repository/home_repository.dart/home_repository.dart';

final getItInstance = GetIt.instance;

Future init() async {

  getItInstance.registerLazySingleton<NetworkApiService>(() => NetworkApiService());

  getItInstance
      .registerLazySingleton<HomeRepository>(() => HomeRepository());

}