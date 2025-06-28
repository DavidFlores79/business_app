import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';

// Suponiendo que tienes estos widgets definidos:
// CustomTextField y PrimaryButton

class SignUpPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  void _onSignup() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: implement signup logic
    }
  }

  void _onGoogleSignIn() {
    // Lógica para signin con google
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen arriba
                _buildHeaderImage(),
                const SizedBox(height: 20),
                _buildOnBoardText(),
                const SizedBox(height: 24),

                // Inputs
                CustomTextField(
                  hintText: 'Full Name',
                  icon: Icons.person,
                  controller: fullNameController,
                  type: InputFieldType.name,
                ),
                const SizedBox(height: 12),

                CustomTextField(
                  hintText: 'E-Mail',
                  icon: Icons.email,
                  controller: emailController,
                  type: InputFieldType.email,
                ),
                const SizedBox(height: 12),

                CustomTextField(
                  hintText: 'Phone No',
                  icon: Icons.phone,
                  controller: phoneController,
                  type: InputFieldType.phone,
                ),
                const SizedBox(height: 12),

                CustomTextField(
                  hintText: 'Password',
                  icon: Icons.fingerprint,
                  controller: passwordController,
                  type: InputFieldType.password,
                ),

                const SizedBox(height: 24),

                // Botón signup
                PrimaryButton(
                  label: 'SIGNUP',
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  expand: true,
                  onTap: _onSignup,
                ),

                const SizedBox(height: 16),

                // Texto OR
                Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Botón google signin
                PrimaryButton(
                  label: 'SIGN-IN WITH GOOGLE',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  image: Image.asset(
                    'assets/images/search.png',
                    height: 20,
                    width: 20,
                  ),
                  expand: true,
                  onTap: _onGoogleSignIn,
                  borderColor: Colors.grey,
                ),

                const SizedBox(height: 16),

                // Texto con link a login
                _buildSigninText(context),
              ],
            ),
          ),
        ),
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

  Widget _buildOnBoardText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get On Board!',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Create your profile to start your Journey.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSigninText(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Already have an account? "),
          TextButton(
            onPressed: () => context.go('/login'),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
