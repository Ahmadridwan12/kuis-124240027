import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../models/pokemon.dart';
import '../widgets/neo_box.dart';
import '../widgets/pokemon_image.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeoBox(
              padding: EdgeInsets.zero,
              child: PokemonImage(
                imagePath: pokemon.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: pokemon.types.map((type) {
                return Chip(
                  label: Text(type),
                  backgroundColor: AppColors.accent,
                  side: const BorderSide(color: AppColors.ink, width: 2),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            NeoBox(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _DetailRow(label: 'Nomor Pokédex', value: '#${pokemon.id}'),
                  const Divider(color: AppColors.ink, thickness: 2),
                  _DetailRow(
                    label: 'Tinggi',
                    value: '${(pokemon.height / 10).toStringAsFixed(1)} m',
                  ),
                  const Divider(color: AppColors.ink, thickness: 2),
                  _DetailRow(
                    label: 'Berat',
                    value: '${(pokemon.weight / 10).toStringAsFixed(1)} kg',
                  ),
                  const Divider(color: AppColors.ink, thickness: 2),
                  _DetailRow(label: 'Ability', value: pokemon.ability),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: NeoBox(
                color: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, color: AppColors.ink),
                    SizedBox(width: 8),
                    Text(
                      'KEMBALI KE BERANDA',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
