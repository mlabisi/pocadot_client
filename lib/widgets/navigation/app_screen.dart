import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppScreen extends HookWidget {
  final PreferredSizeWidget? appBar;
  final Widget? content;

  const AppScreen({super.key, this.appBar, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: content,
    );
  }
}
