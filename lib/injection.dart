import 'package:flutter_application_1/blocs/menu_bloc.dart';
import 'package:flutter_application_1/blocs/reositories_food.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

void configureDependencies() {
  //Repositories
  getIt.registerLazySingleton<FoodRepository>(() => FoodRepository());

  //BLoC
  getIt.registerFactory<FoodBloc>(() => FoodBloc(getIt<FoodRepository>()));
}
