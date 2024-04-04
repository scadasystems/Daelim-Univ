import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      child: const Placeholder(),
    );
  }
}
