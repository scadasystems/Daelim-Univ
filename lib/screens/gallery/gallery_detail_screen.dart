import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatelessWidget {
  final int? id;

  const GalleryDetailScreen({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    Log.green('ID: $id');

    return AppScaffold(
      enableDrawer: false,
      appBar: AppBar(
        title: const Text('상세보기'),
      ),
      child: const SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
