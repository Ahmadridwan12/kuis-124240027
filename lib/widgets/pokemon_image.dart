import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class PokemonImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const PokemonImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.ink, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          5,
        ), // Slightly smaller than border radius
        child: Image.network(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.primary,
              child: const Icon(
                Icons.catching_pokemon,
                size: 40,
                color: AppColors.ink,
              ),
            );
          },
        ),
      ),
    );
  }
}
