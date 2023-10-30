import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerdbug_portfolio/data/work_data.dart';
import 'package:nerdbug_portfolio/presentation/my_work/components/work_card.dart';

class MyWorkScreenUi extends StatelessWidget {
  const MyWorkScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TODO: Consider moving this to the app bar
              Text(
                "Work I've done",
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final workItem = workData[index];

                    return WorkCard(
                      date: workItem.date,
                      role: workItem.role,
                      company: workItem.company,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: workData.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
