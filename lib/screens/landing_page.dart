import 'package:flutter/material.dart';
import 'package:gdsc_task/screens/body.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Body(),
                ),
              );
            },
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Text(
                "Task Completed",
                style: GoogleFonts.bubblegumSans(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Text(
              "🔥🔥🔥",
              style: GoogleFonts.bubblegumSans(
                  fontSize: 30, color: Theme.of(context).colorScheme.primary),
            ),
            Image.asset('assets/task.gif'),
          ],
        ),
      ),
    );
  }
}
