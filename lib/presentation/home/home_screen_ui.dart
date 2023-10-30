import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenUi extends StatelessWidget {
  const HomeScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hey 👋🏽",
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 44,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "I'm Ellis Ifoegbu",
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
                RichText(
                  text: TextSpan(
                    text: 'I build mobile applications using ',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      height: 1.2,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'flutter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2980b9),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffD5A778),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    "View my work",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
