import 'package:foodix/cubit/categories/meal_categories_cubit.dart';
import 'package:foodix/cubit/meals/meals_cubit.dart';
import 'package:foodix/data/repository/meal_repository.dart';
import 'package:get_it/get_it.dart';

import 'data/api/api_client.dart';

final getIt = GetIt.instance;

void getItInject() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<MealRepository>(
      () => MealRepository(apiClient: getIt.get<ApiClient>()));
  getIt.registerFactory<MealCategoriesCubit>(
      () => MealCategoriesCubit(repository: getIt.get<MealRepository>()));
  getIt.registerFactory<MealsCubit>(
      () => MealsCubit(repository: getIt.get<MealRepository>()));
}
