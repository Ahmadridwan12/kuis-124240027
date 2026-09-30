import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Pokemon',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      // Menggunakan routes agar Navigator.pushNamedAndRemoveUntil di ProfilePage bekerja
      initialRoute: '/login',
      routes: {'/login': (context) => const LoginScreen()},
      // LoginScreen menggunakan pushReplacement ke MainShell,
      // sehingga MainShell tidak perlu di routes jika hanya diakses dari LoginScreen.
    );
  }
}
