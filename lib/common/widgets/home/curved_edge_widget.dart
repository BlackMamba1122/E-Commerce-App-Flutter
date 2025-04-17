import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/home/curved_edges.dart';


class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: child
    );
  }
}