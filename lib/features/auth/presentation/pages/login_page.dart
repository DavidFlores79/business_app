import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Welcome Back,',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text('Make it work, make it right, make it fast.'),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: 'E-Mail')),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextButton(onPressed: () {}, child: const Text('Forget Password?')),
            ElevatedButton(onPressed: () {}, child: const Text('LOGIN')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.g_mobiledata),
                  SizedBox(width: 8),
                  Text('Sign-In with Google'),
                ],
              ),
            ),
            TextButton(
              onPressed: () => context.go('/signup'),
              child: const Text("Don't have an Account? Signup"),
            ),
          ],
        ),
      ),
    );
  }
}
