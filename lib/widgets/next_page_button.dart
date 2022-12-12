import 'package:flutter/material.dart';

import '../screens/landing_page.dart';

import 'package:google_fonts/google_fonts.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    Key? key,
    required this.pageWidth,
    required this.pageHeight,
  }) : super(key: key);

  final double pageWidth;
  final double pageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: pageWidth * 0.8,
      height: pageHeight * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LandingPage(),
              ),
            );
          },
          child: Text(
            'Get Started',
            style: GoogleFonts.inter(
                fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
