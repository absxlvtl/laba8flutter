import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Помилка реєстрації"),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Зрозуміло"))
        ],
      ),
    );
  }

  void _handleSignUp() {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || _passController.text.isEmpty) {
      _showError("Всі поля обов'язкові!");
    } else if (_passController.text.length < 7) {
      _showError("Пароль має бути не менше 7 символів!");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Акаунт створено!')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Реєстрація')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Ім\'я')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passController, obscureText: true, decoration: const InputDecoration(labelText: 'Пароль')),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _handleSignUp, child: const Text('Зареєструватися')),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Вже є акаунт? Увійти')),
          ],
        ),
      ),
    );
  }
}