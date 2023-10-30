import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({
    super.key,
    required this.date,
    required this.role,
    required this.company,
  });

  final String date;
  final String role;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              date,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              role,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              company,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
