// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:vegetasi_app/page/onboarding_1.dart';
import 'package:vegetasi_app/page/onboarding_2.dart';
import 'package:vegetasi_app/page/onboarding_3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _updateCurrentPageIndex,
            children: const [
              // Replace these with your actual content for the onboarding pages
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IndicatorDot(
                  isSelected: _currentPageIndex == 0,
                ),
                const SizedBox(width: 8),
                IndicatorDot(
                  isSelected: _currentPageIndex == 1,
                ),
                const SizedBox(width: 8),
                IndicatorDot(
                  isSelected: _currentPageIndex == 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isSelected;

  const IndicatorDot({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicatorColor = isSelected ? Colors.white : const Color(0XFF32A060);

    return Container(
  width: 10,
  height: 10,
  decoration: BoxDecoration(
    color: indicatorColor,
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.white,
      width: 2, // Adjust the width as needed
    ),
  ),
);
  }
}
