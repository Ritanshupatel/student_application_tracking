import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_application_tracking/providers/auth_provider.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool success = await Provider.of<AuthProvider>(context, listen: false)
                      .signIn(emailController.text, passwordController.text);

                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => DashboardScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));
                  }
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () async {
                  bool success = await Provider.of<AuthProvider>(context, listen: false)
                      .signUp(emailController.text, passwordController.text);

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created!')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup Failed')));
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
