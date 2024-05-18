import 'package:flutter/material.dart';

class ChangeNotifierWidget extends StatefulWidget {
  final ChangeNotifier changeNotifier;
  final Widget Function(ChangeNotifier changeNotifier) builder;
  final Future<void> Function(ChangeNotifier changeNotifier)? onChanged;
  const ChangeNotifierWidget({super.key, required this.changeNotifier, required this.builder, this.onChanged});

  @override
  State<ChangeNotifierWidget> createState() => _ChangeNotifierWidgetState();
}

class _ChangeNotifierWidgetState extends State<ChangeNotifierWidget> {
  @override
  Widget build(BuildContext context) => widget.builder.call(widget.changeNotifier);
  @override
  void initState() {
    super.initState();
    widget.changeNotifier.addListener(_update);
  }

  void _update() async {
    if (widget.onChanged != null) {
      await widget.onChanged!.call(widget.changeNotifier);
    }
    setState(() {});
  }

  @override
  void dispose() {
    widget.changeNotifier.removeListener(_update);
    super.dispose();
  }
}

extension ChangeNotifierEx on ChangeNotifier {
  Widget toWidget(
    Widget Function(ChangeNotifier changeNotifier) builder, {
    Future<void> Function(ChangeNotifier changeNotifier)? onChanged,
  }) =>
      ChangeNotifierWidget(
        key: ValueKey(this),
        builder: builder,
        changeNotifier: this,
        onChanged: onChanged,
      );
}

extension WidgetExApplyChangeNotifier on Widget {
  Widget applyChangeNotifier(
    ChangeNotifier changeNotifier, {
    Future<void> Function(ChangeNotifier changeNotifier)? onChanged,
  }) =>
      changeNotifier.toWidget(
        (changeNotifier) => this,
        onChanged: onChanged,
      );
}
