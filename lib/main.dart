import 'package:flutter/material.dart';
// Переконайтеся, що шлях до ваших екранів правильний
import 'screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ЛР 8: Темування та Форми',

      // ===============================================
      // ГЛОБАЛЬНА ТЕМА: Стилі ЛР №8
      // ===============================================
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

        // 1. Стилі для AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo, // Темний фон AppBar
          foregroundColor: Colors.white,   // Білий текст AppBar
          centerTitle: true,
        ),

        // 2. Стилі для ElevatedButton (Головна кнопка: Увійти, Зареєструватися)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.indigo, // Темно-синій фон
            foregroundColor: Colors.white,  // Білий текст
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // 3. Стилі для OutlinedButton (Додаткові кнопки: Реєстрація, Скидання)
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            foregroundColor: Colors.blueGrey,
            side: const BorderSide(color: Colors.blueGrey, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),

        // 4. Стилі для TextFormField
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.blueGrey),
          // Вигляд помилки
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
      ),
      // ===============================================

      home: const SignInScreen(),
    );
  }
}