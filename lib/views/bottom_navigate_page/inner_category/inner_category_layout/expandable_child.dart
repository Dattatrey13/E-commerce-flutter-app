import 'package:flutter/material.dart';

class ChildExpandable extends StatelessWidget {
  final bool? expanded;
  final double? expandedHeight;
  final double? collapsedHeight;
  final Widget? child;

  const ChildExpandable({
    Key? key,
    this.child,
    this.collapsedHeight = 0.0,
    this.expanded,
    this.expandedHeight = 300.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: expanded! ? null : collapsedHeight,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(0.0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
