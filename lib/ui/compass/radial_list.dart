import 'package:flutter/material.dart';
import 'dart:math';

class RadialList extends StatefulWidget {
  final RadialListViewModel radialList;
  final double radius;
  final double degree;

  const RadialList({
    super.key,
    required this.radialList,
    required this.radius,
    required this.degree,
  });

  List<Widget> _radialListItems() {
    const double firstItemAngle = pi;
    final double angleDiff = (firstItemAngle + pi) / (radialList.items.length);

    double currentAngle = (degree * (pi / 180) * -1);
    return radialList.items.map((RadialListItemViewModel viewModel) {
      final listItem = _radialListItem(viewModel, currentAngle);
      currentAngle += angleDiff;
      return listItem;
    }).toList();
  }

  Widget _radialListItem(RadialListItemViewModel viewModel, double angle) {
    return RadialPosition(
      radius: radius,
      angle: angle,
      child: RadialListItem(
        listItem: viewModel,
      ),
    );
  }

  @override
  RadialListState createState() {
    return RadialListState();
  }
}

class RadialListState extends State<RadialList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget._radialListItems(),
    );
  }
}

class RadialListItem extends StatefulWidget {
  final RadialListItemViewModel listItem;

  const RadialListItem({super.key, required this.listItem});

  @override
  RadialListItemState createState() {
    return RadialListItemState();
  }
}

class RadialListItemState extends State<RadialListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: TextButton(
          onPressed: () {
            setState(() {
              widget.listItem.isSelected = true;
            });
          },
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.listItem.name.toString(),
              style: TextStyle(
                color: widget.listItem.color ?? Colors.black,
                fontSize: widget.listItem.fontSize ?? 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadialListViewModel {
  final List<RadialListItemViewModel> items;

  RadialListViewModel({
    this.items = const [],
  });
}

class RadialListItemViewModel {
  String name;
  bool isSelected;
  double? fontSize;
  Color? color;
  RadialListItemViewModel({
    this.color,
    this.isSelected = false,
    required this.name,
    this.fontSize,
  });
}

class RadialPosition extends StatefulWidget {
  final double radius;
  final double angle;
  final Widget child;

  const RadialPosition({
    super.key,
    required this.angle,
    required this.child,
    required this.radius,
  });

  @override
  RadialPositionState createState() {
    return RadialPositionState();
  }
}

class RadialPositionState extends State<RadialPosition> {
  @override
  Widget build(BuildContext context) {
    final x = cos(widget.angle) * widget.radius;
    final y = sin(widget.angle) * widget.radius;

    return Transform(
      transform: Matrix4.translationValues(x, y, 0.0),
      child: widget.child,
    );
  }
}

final RadialListViewModel radialNumbers = RadialListViewModel(
  items: [
    RadialListItemViewModel(
      name: 'E',
      isSelected: false,
    ),
    RadialListItemViewModel(
      name: 'se',
      isSelected: false,
      fontSize: 30,
    ),
    RadialListItemViewModel(
      name: 'S',
      isSelected: false,
    ),
    RadialListItemViewModel(
      name: 'so',
      isSelected: false,
      fontSize: 30,
    ),
    RadialListItemViewModel(
      name: 'O',
      isSelected: false,
    ),
    RadialListItemViewModel(
      name: 'no',
      isSelected: false,
      fontSize: 30,
    ),
    RadialListItemViewModel(
      name: 'N',
      isSelected: false,
      color: Colors.red,
    ),
    RadialListItemViewModel(
      name: 'ne',
      isSelected: false,
      fontSize: 30,
    ),
  ],
);
