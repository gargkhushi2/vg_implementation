import 'package:flutter/material.dart';

// Common layout for displaying the images
class ImageLayout extends StatelessWidget {
  const ImageLayout({
    super.key,
    required this.imageName,
    this.scaleSize = 4,
    this.onAssetImageTap,
  });
  final String imageName;
  final double? scaleSize;
  final VoidCallback? onAssetImageTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAssetImageTap,
      child: Image.asset(
        imageName,
        scale: scaleSize,
        fit: BoxFit.cover,
      ),
    );
  }
}
