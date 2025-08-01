import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef BuildWhen<T> = bool Function(T previous, T current);

class SmartValueListenableBuilder<T> extends StatefulWidget {
  final ValueListenable<T> listenable;
  final Widget Function(BuildContext, T) builder;
  final BuildWhen<T>? buildWhen;

  const SmartValueListenableBuilder({
    required this.listenable,
    required this.builder,
    super.key,
    this.buildWhen,
  });

  @override
  State<SmartValueListenableBuilder<T>> createState() => _SmartValueListenableBuilderState<T>();
}

class _SmartValueListenableBuilderState<T> extends State<SmartValueListenableBuilder<T>> {
  late T _latestValue;

  @override
  void initState() {
    super.initState();
    _latestValue = widget.listenable.value;
    widget.listenable.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant SmartValueListenableBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.listenable != oldWidget.listenable) {
      oldWidget.listenable.removeListener(_listener);
      _latestValue = widget.listenable.value;
      widget.listenable.addListener(_listener);
    }
  }

  void _listener() {
    final next = widget.listenable.value;
    final shouldBuild = widget.buildWhen?.call(_latestValue, next) ?? true;
    if (shouldBuild) {
      setState(() => _latestValue = next);
    } else {
      _latestValue = next;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _latestValue);
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_listener);
    super.dispose();
  }
}
