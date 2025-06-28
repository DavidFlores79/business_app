import 'package:flutter/material.dart';
import 'core/config/routes/app_router.dart';
import 'core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // setup GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Clean App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
