import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
