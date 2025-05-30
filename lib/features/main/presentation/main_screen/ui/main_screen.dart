import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:raintor_test/features/main/presentation/main_screen/ui/widgets/main_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      navigationShell: navigationShell,
    );
  }
}
