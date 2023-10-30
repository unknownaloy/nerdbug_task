import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerdbug_portfolio/presentation/my_repo/my_repo_vm.dart';
import 'package:provider/provider.dart';

class MyRepoScreenUi extends StatefulWidget {
  const MyRepoScreenUi({super.key});

  @override
  State<MyRepoScreenUi> createState() => _MyRepoScreenUiState();
}

class _MyRepoScreenUiState extends State<MyRepoScreenUi> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    context.read<MyRepoViewModel>().fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<MyRepoViewModel>(
            builder: (_, model, __) => model.requestState.maybeWhen(
                loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                orElse: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                success: () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // TODO: Consider moving this to the app bar
                      Text(
                        "My repos",
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
                            final repo = model.repos[index];


                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      repo.name,
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context).textTheme.displayMedium,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );

                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: model.repos.length,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
