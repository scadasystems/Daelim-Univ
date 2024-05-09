// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daelim_univ/common/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool enableDrawer;
  final Widget child;

  const AppScaffold({
    super.key,
    this.floatingActionButton,
    this.appBar,
    this.bottomNavigationBar,
    this.enableDrawer = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: enableDrawer ? const AppDrawer() : null,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
