import 'package:flutter/material.dart';

import 'add_shimmer.dart';

class LoadingOrderBook extends StatelessWidget {
  const LoadingOrderBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (var i = 0; i < 5; i++)
        AddShimmer(
          child: ListTile(
            title: buildLoadingAnimation(context),
          ),
        ),
    ]);
  }

  Widget buildLoadingAnimation(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      height: 30,
      margin: const EdgeInsets.only(
        top: 0.0,
        bottom: 0.0,
      ),
    );
  }
}
