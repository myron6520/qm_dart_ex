import 'package:flutter/material.dart';

class ChangeNotifierWidget extends StatefulWidget {
  final ChangeNotifier changeNotifier;
  final Widget Function() builder;
  const ChangeNotifierWidget(
      {super.key, required this.changeNotifier, required this.builder});

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

  void _update() => setState(() {});
  @override
  void dispose() {
    widget.changeNotifier.removeListener(_update);
    super.dispose();
  }
}

extension ChangeNotifierEx on ChangeNotifier {
  Widget toWidget(Widget Function() builder) =>
      ChangeNotifierWidget(builder: builder, changeNotifier: this);
}

extension WidgetExApplyChangeNotifier on Widget {
  Widget applyChangeNotifier(ChangeNotifier changeNotifier) =>
      changeNotifier.toWidget(() => this);
}
