import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/routes/app_router.dart';
import 'core/di/injector.dart';
import 'features/product/presentation/bloc/categories/category_bloc.dart';
import 'features/product/presentation/bloc/categories/category_event.dart';
import 'features/product/presentation/bloc/products/product_bloc.dart';
import 'features/product/presentation/bloc/products/product_event.dart';
import 'theme/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // setup GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ProductBloc>()..add(LoadInitialProducts()),
        ),
        BlocProvider(
          create: (_) => sl<CategoryBloc>()..add(LoadInitialCategories()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Business App',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.primary,
            onPrimary: Colors.white,
            primaryContainer: AppColors.primaryLight,
            onPrimaryContainer: AppColors.primaryDark,
            secondary: AppColors.secondary,
            onSecondary: Colors.black,
            secondaryContainer: AppColors.secondaryLight,
            onSecondaryContainer: AppColors.secondaryDark,
            tertiary: AppColors.tertiary,
            onTertiary: Colors.black,
            tertiaryContainer: AppColors.tertiaryLight,
            onTertiaryContainer: AppColors.tertiaryDark,
            surface: AppColors.surface,
            onSurface: AppColors.onSurface,
            error: AppColors.error,
            onError: AppColors.onError,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
