import 'package:flutter/material.dart';
import 'package:nerdbug_portfolio/presentation/my_repo/my_repo_vm.dart';
import 'package:nerdbug_portfolio/presentation/nerdbug_home.dart';
import 'package:nerdbug_portfolio/repositories/api_service.dart';
import 'package:nerdbug_portfolio/utilities/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyRepoViewModel>(
          create: (_) => MyRepoViewModel(
            apiServices: locator<ApiServices>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Nerdbug Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NerdbugHome(),
      ),
    );
  }
}
