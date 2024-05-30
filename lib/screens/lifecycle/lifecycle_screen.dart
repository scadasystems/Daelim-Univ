import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/localization/app_string.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LifecycleScreen extends StatefulWidget {
  const LifecycleScreen({super.key});

  @override
  State<LifecycleScreen> createState() => _LifecycleScreenState();
}

class _LifecycleScreenState extends State<LifecycleScreen> {
  late final AppLifecycleListener _listener;
  late AppLifecycleState? _state;

  @override
  void initState() {
    super.initState();

    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onShow: () => Log.green('show'),
      onResume: () => Log.green('resume'),
      onHide: () => Log.green('hide'),
      onInactive: () => Log.green('inactive'),
      onPause: () => Log.green('pause'),
      onDetach: () => Log.green('detach'),
      onRestart: () => Log.green('restart'),
      // onStateChange: _handleStateChange,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(AppString.lifecycle.tr),
      ),
      child: const Center(),
    );
  }
}
