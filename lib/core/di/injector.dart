import 'package:business_app/features/product/domain/usecases/get_categories_usecase.dart';
import 'package:business_app/features/product/presentation/bloc/categories/category_bloc.dart';
import 'package:business_app/features/product/presentation/bloc/products/product_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/bloc/login_cubit.dart';
import '../../features/product/data/datasources/product_remote_datasource.dart';
import '../../features/product/data/repositories/product_repository_impl.dart';
import '../../features/product/domain/repositories/product_repository.dart';
import '../../features/product/domain/usecases/get_products_usecase.dart';
import '../network/dio_client.dart';
import '../services/local_storage_service.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Aquí puedes registrar cubits/repositorios/etc
  // Core
  sl.registerLazySingleton<TokenStorageService>(
    () => TokenStorageServiceImpl(),
  );

  // Registra DioClient (solo necesita TokenStorageService)
  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<TokenStorageService>()),
  );
  // Data Layer
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Cubits
  sl.registerFactory(() => LoginCubit(sl()));

  //Products and Categories
  // Data Layer
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

  // Bloc (registrar al final)
  sl.registerFactory(() => ProductBloc(sl<GetProductsUseCase>()));
  sl.registerFactory(() => CategoryBloc(sl<GetCategoriesUseCase>()));
}
