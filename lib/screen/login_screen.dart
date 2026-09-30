import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../services/auth_service.dart';
import '../widgets/neo_box.dart';
import '../widgets/neo_button.dart';
import '../widgets/neo_text_field.dart';
import 'main_shell.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _handleLogin() {
    final username = _userController.text;
    final password = _passController.text;

    if (AuthService.login(username, password)) {
      // Snackbar Hijau: Login Berhasil
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.success,
          content: Text(
            'Login berhasil! Selamat datang, $username',
            style: const TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );

      // Pindah ke MainShell
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainShell(username: username)),
      );
    } else {
      // Snackbar Merah: Login Gagal
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.danger,
          content: Text(
            'Username atau password salah.',
            style: const TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              NeoBox(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo / Icon
                    NeoBox(
                      color: AppColors.primary,
                      padding: const EdgeInsets.all(16),
                      child: const Icon(
                        Icons.catching_pokemon,
                        size: 64,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'DAFTAR POKEMON',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    NeoTextField(controller: _userController, hint: 'Username'),
                    const SizedBox(height: 16),
                    NeoTextField(
                      controller: _passController,
                      hint: 'Password (NIM)',
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    NeoButton(
                      label: 'LOGIN',
                      color: AppColors.primary,
                      onPressed: _handleLogin,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
