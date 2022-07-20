import 'package:bienestar_animal/features/new_post/create_new_postcubit/create_new_post_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/category_repository.dart';
import '../data/repositories/location_repository.dart';
import '../data/repositories/post_repository.dart';
import '../features/information/categories_cubit/categories_cubit.dart';
import '../features/information/posts_cubit/posts_cubit.dart';
import '../features/map/location_cubit/location_cubit.dart';
import 'network/network_info.dart';
import 'utils/local_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Category
  sl.registerFactory(() => CategoriesCubit(categoryRepository: sl()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepository(networkInfo: sl(), client: sl()));

  // Posts
  sl.registerFactory(() => PostsCubit(postRepository: sl()));
  sl.registerFactory(() => CreateNewPostCubit(postRepository: sl()));
  sl.registerLazySingleton<PostRepository>(
      () => PostRepository(client: sl(), networkInfo: sl()));

  // Map
  sl.registerFactory(() => LocationCubit(locationRepository: sl()));
  sl.registerLazySingleton<LocationRepository>(() => LocationRepository());

  // CORE
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton<LocalStorage>(
    () => LocalStorage(sharedPreferences: sl(), secureStorage: sl()),
  );

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
}
