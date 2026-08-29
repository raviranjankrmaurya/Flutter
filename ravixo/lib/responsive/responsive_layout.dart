import 'package:flutter/material.dart';
import 'package:ravixo/screens/mobile_screen.dart';
import 'package:ravixo/screens/web_screen.dart';

// import 'package:flutter/rendering.dart';
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({
    super.key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // Web Screen
         return WebScreen();
        }
        // mobile Screen
        return MobileScreen();
      },
    );
  }
}
