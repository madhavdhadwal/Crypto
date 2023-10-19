import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AddShimmer extends StatelessWidget {
  final Widget child;
  const AddShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: child,
        baseColor: Colors.grey.shade200,
        highlightColor: Constants());
  }
}
