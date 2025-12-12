import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'recover_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  // Функція для показу вікна з помилкою
  void _showError(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Помилка"),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("ОК"))
        ],
      ),
    );
  }

  void _handleSignIn() {
    String login = _loginController.text;
    String pass = _passwordController.text;

    if (login.isEmpty || pass.isEmpty) {
      _showError("Будь ласка, заповніть усі поля!");
    } else if (!login.contains('@')) {
      _showError("Введіть коректний Email!");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Вхід успішний!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизація')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const FlutterLogo(size: 80),
              const SizedBox(height: 20),
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Логін або Email'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _handleSignIn,
                child: const Text('Увійти'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen())),
                child: const Text('Реєстрація'),
              ),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RecoverPasswordScreen())),
                child: const Text('Забули пароль?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}