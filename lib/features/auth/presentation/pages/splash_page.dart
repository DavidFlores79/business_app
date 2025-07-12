import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _handleRedirect();
  }

  Future<void> _handleRedirect() async {
    await Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (context.mounted) {
        context.go('/store');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          'LOGO',
          style: theme.textTheme.headlineLarge?.copyWith(
            color: AppColors.secondaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
