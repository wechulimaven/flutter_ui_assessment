import 'package:flutter_assessment/core/blocs/products/product_cubit.dart';
import 'package:flutter_assessment/core/local_storage/shared_preference_helper.dart';
import 'package:flutter_assessment/core/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/utils/platform_utils.dart';

GetIt inject = GetIt.instance;

Future<void> setUpLocator() async {
  inject.registerFactory<PlatformUtils>(() => PlatformUtilsImpl());

  // local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerSingleton<SharedHelper>(
      SharedHelperImpl(sharedPreferences: inject()));

  inject
      .registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());

  inject.registerFactory<ProductsCubit>(() => ProductsCubit(inject()));
}
