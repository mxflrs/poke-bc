import 'package:flutter/material.dart';
import 'package:test1/theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Pokemon...',
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          suffixIcon: Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(64),
            ),
            child: Image.asset('assets/images/searchicon.png', scale: 3),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );
  }
}
