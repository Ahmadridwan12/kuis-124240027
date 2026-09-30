import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class NeoBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final Offset shadowOffset;

  const NeoBox({
    super.key,
    required this.child,
    this.color = AppColors.surface,
    this.padding,
    this.shadowOffset = const Offset(4, 4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.ink, width: 3),
        boxShadow: [
          BoxShadow(color: AppColors.ink, offset: shadowOffset, blurRadius: 0),
        ],
      ),
      child: child,
    );
  }
}
