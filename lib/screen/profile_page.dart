import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/neo_box.dart';
import '../widgets/neo_button.dart';

const String _maleCharacterImage =
    'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
const String _femaleCharacterImage =
    'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedImage = _maleCharacterImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 132,
              height: 132,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.ink, width: 4),
                boxShadow: const [
                  BoxShadow(color: AppColors.ink, offset: Offset(4, 4)),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  _selectedImage,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 64, color: AppColors.ink),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 24),
            NeoBox(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCharacterButton(
                  image: _maleCharacterImage,
                  label: 'Male Character',
                ),
                const SizedBox(width: 16),
                _buildCharacterButton(
                  image: _femaleCharacterImage,
                  label: 'Female Character',
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Tombol Logout
            NeoButton(
              label: 'LOGOUT',
              color: AppColors.primary,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterButton({required String image, required String label}) {
    final isActive = _selectedImage == image;
    return GestureDetector(
      onTap: () => setState(() => _selectedImage = image),
      child: Semantics(
        button: true,
        selected: isActive,
        label: label,
        child: NeoBox(
          color: isActive ? AppColors.accent : AppColors.surface,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                image,
                width: 76,
                height: 112,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 76,
                  height: 112,
                  child: Icon(Icons.person, size: 40, color: AppColors.ink),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
