import 'package:flutter/material.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final _emailController = TextEditingController();

  void _handleRecover() {
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Помилка"),
          content: const Text("Введіть коректну адресу для відновлення!"),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("ОК"))],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Інструкції надіслано!')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Відновлення')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Введіть ваш Email для отримання посилання на скидання паролю'),
            const SizedBox(height: 20),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _handleRecover, child: const Text('Відновити пароль')),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Назад')),
          ],
        ),
      ),
    );
  }
}