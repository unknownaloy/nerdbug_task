import 'package:flutter/material.dart';
import 'package:nerdbug_portfolio/presentation/home/home_screen_ui.dart';
import 'package:nerdbug_portfolio/presentation/my_repo/screen/my_repo_screen_ui.dart';
import 'package:nerdbug_portfolio/presentation/my_work/screen/my_work_screen_ui.dart';

class NerdbugHome extends StatefulWidget {
  const NerdbugHome({super.key});

  @override
  State<NerdbugHome> createState() => _NerdbugHomeState();
}

class _NerdbugHomeState extends State<NerdbugHome> {
  late final PageController _pageController;

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreenUi(),
    const MyWorkScreenUi(),
    const MyRepoScreenUi(),
  ];

  void _handlePageTap(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _handlePageTap(index),
        items: [
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the home screen",
              enabled: _selectedIndex == 0,
              child: const Icon(Icons.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the characters screen",
              enabled: _selectedIndex == 1,
              child: const Icon(Icons.work),
            ),
            label: "Work",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the quiz screen",
              enabled: _selectedIndex == 2,
              child: const Icon(Icons.cloud_download),
            ),
            label: "Repositories",
          ),
        ],
      ),
    );
  }
}
