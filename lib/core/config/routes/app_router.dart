import 'package:business_app/features/product/presentation/pages/product_detail_page.dart';
import 'package:business_app/features/product/presentation/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/presentation/bloc/login_cubit.dart';
import '../../../features/auth/presentation/pages/splash_page.dart';
import '../../../features/auth/presentation/pages/auth_landing_page.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../../features/auth/presentation/pages/signup_page.dart';
import '../../di/injector.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/auth', builder: (_, __) => const AuthLandingPage()),
      GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
      GoRoute(
        path: '/store',
        name: 'store',
        builder: (context, state) => const StorePage(),
      ),
      GoRoute(
        path: '/product-detail/:productId', // 👈 Recibe un parámetro
        builder: (context, state) {
          final productId = state.pathParameters['productId']!;
          return ProductDetailPage(
            productId: productId,
          ); // Pásalo al constructor
        },
      ),

      /// ✅ Ruta protegida: Checkout (requiere token)
      // GoRoute(
      //   path: '/checkout',
      //   name: 'checkout',
      //   builder: (context, state) => const CheckoutPage(),
      //   redirect: (context, state) async {
      //     final token = await sl<TokenStorageService>().getToken();
      //     return (token == null || token.isEmpty) ? '/login' : null;
      //   },
      // ),
      GoRoute(
        path: '/login',
        builder:
            (context, state) => BlocProvider(
              create: (_) => sl<LoginCubit>(),
              child: const LoginPage(),
            ),
      ),

      GoRoute(path: '/signup', builder: (_, __) => SignUpPage()),
    ],
  );

  // Método para redirección programática desde el interceptor
  static void redirectToAuth() {
    _rootNavigatorKey.currentContext?.go('/auth');
  }
}
