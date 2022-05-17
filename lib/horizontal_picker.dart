import 'package:flutter/cupertino.dart';

class HorizontalPicker extends StatefulWidget {
  final int childCount;
  final double itemExtent;
  final FixedExtentScrollController controller;
  final Function(int index) selectedIndex;
  final Widget Function(BuildContext context, int index) builder;
  final double squeeze;

  HorizontalPicker({
    required this.childCount,
    required this.builder,
    required this.controller,
    required this.itemExtent,
    required this.selectedIndex,
    this.squeeze = 0.5,
    Key? key,
  }) : super(key: key);

  @override
  _HorizontalPickerState createState() => _HorizontalPickerState();
}

class _HorizontalPickerState extends State<HorizontalPicker> {
  @override
  Widget build(BuildContext context) => _wheel();

  int selectedIndex = 0;

  Widget _wheel() {
    return RotatedBox(
      quarterTurns: 3,
      child: ListWheelScrollView.useDelegate(
        itemExtent: widget.itemExtent,
        controller: widget.controller,
        diameterRatio: 30,
        squeeze: widget.squeeze,
        onSelectedItemChanged: (index) => widget.selectedIndex(index),
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: widget.childCount,
            builder: (context, index) => RotatedBox(
                quarterTurns: 1, child: widget.builder(context, index))),
      ),
    );
  }
}
