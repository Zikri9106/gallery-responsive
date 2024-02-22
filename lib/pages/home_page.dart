import 'package:flutter/material.dart';
import 'package:responsive_view/utils/app_colors.dart';
import '../layouts/mobile_layout.dart';
import '../layouts/tablet_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Gallery App',
          style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textColor),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 650) {
            return const MobileLayout();
          } else {
            return const TabletLayout();
          }
        },
      ),
    );
  }
}
