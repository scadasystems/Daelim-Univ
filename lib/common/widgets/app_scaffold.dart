// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget child;

  const AppScaffold({
    super.key,
    this.floatingActionButton,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
