import 'package:flutter/material.dart';

class ChangeNotifierWidget extends StatefulWidget {
  final ChangeNotifier changeNotifier;
  final Widget Function() builder;
  final Future<void> Function()? onChanged;
  const ChangeNotifierWidget(
      {super.key,
      required this.changeNotifier,
      required this.builder,
      this.onChanged});

  @override
  State<ChangeNotifierWidget> createState() => _ChangeNotifierWidgetState();
}

class _ChangeNotifierWidgetState extends State<ChangeNotifierWidget> {
  @override
  Widget build(BuildContext context) => widget.builder.call();
  @override
  void initState() {
    super.initState();
    widget.changeNotifier.addListener(_update);
  }

  void _update() async {
    if (widget.onChanged != null) {
      await widget.onChanged!.call();
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
  Widget toWidget(Widget Function() builder,
          {Future<void> Function()? onChanged}) =>
      ChangeNotifierWidget(
        builder: builder,
        changeNotifier: this,
        onChanged: onChanged,
      );
}

extension WidgetExApplyChangeNotifier on Widget {
  Widget applyChangeNotifier(ChangeNotifier changeNotifier,
          {Future<void> Function()? onChanged}) =>
      changeNotifier.toWidget(() => this, onChanged: onChanged);
}
