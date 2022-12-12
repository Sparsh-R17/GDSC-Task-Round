import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextData extends StatelessWidget {
  const TextData({
    Key? key,
    required this.bodyPage,
    required this.titlePage,
  }) : super(key: key);

  final String titlePage;
  final String bodyPage;

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.fromLTRB(0, pageHeight * 0.01, 0, 0),
          padding: EdgeInsets.fromLTRB(0, pageHeight * 0.03, 0, 0),
          child: Text(
            titlePage,
            style: GoogleFonts.poppins(
              color: const Color(0xff1c006a),
              fontWeight: FontWeight.w700,
              fontSize: 24,
              shadows: [
                Shadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4)),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            pageWidth * 0.02,
            pageHeight * 0.02,
            pageWidth * 0.02,
            0,
          ),
          width: pageWidth * 0.9,
          height: pageHeight * 0.24,
          child: Text(
            bodyPage,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: pageHeight * 0.023,
              color: const Color.fromARGB(255, 103, 103, 103),
            ),
          ),
        ),
      ],
    );
  }
}
