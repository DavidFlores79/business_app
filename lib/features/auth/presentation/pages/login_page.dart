import 'package:business_app/features/auth/presentation/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injector.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../bloc/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: implement login logic
      context.read<LoginCubit>().login(
        emailController.text.trim(),
        passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.go('/home');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    _buildHeaderImage(),
                    const SizedBox(height: 20),
                    _buildWelcomeText(),
                    const SizedBox(height: 32),
                    CustomTextField(
                      hintText: 'E-Mail',
                      icon: Icons.email_outlined,
                      controller: emailController,
                      type: InputFieldType.email,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'Password',
                      icon: Icons.fingerprint,
                      controller: passwordController,
                      type: InputFieldType.password,
                    ),
                    const SizedBox(height: 8),
                    _buildForgotPasswordButton(),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      isLoading: isLoading,
                      label: 'LOGIN',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      expand: true,
                      onTap: _onLogin,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      label: 'Sign-In with Google',
                      backgroundColor: Colors.white.withAlpha(230),
                      textColor: Colors.black,
                      image: Image.asset(
                        'assets/images/search.png',
                        width: 24,
                        height: 24,
                      ),
                      expand: true,
                      onTap: () {
                        // TODO: Google Sign-In
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSignupText(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Center(
      child: Image.asset(
        'assets/images/robot.png',
        width: 160,
        height: 160,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back,',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Make it work, make it right, make it fast.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Implement forgot password logic
        },
        style: TextButton.styleFrom(foregroundColor: Colors.blue),
        child: const Text('Forgot Password?'),
      ),
    );
  }

  Widget _buildSignupText(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Don't have an account?"),
          TextButton(
            onPressed: () => context.go('/signup'),
            child: Text(
              "SIGNUP",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
