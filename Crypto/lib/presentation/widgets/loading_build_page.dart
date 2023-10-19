import 'package:flutter/material.dart';

import '../../constants.dart';
import 'add_shimmer.dart';

class LoadingBuildPage extends StatelessWidget {
  const LoadingBuildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AddShimmer(
        child: ListTile(
          title: buildLoadingAnimation(context),
          subtitle: buildLoadingAnimation(context),
        ),
      ),
      AddShimmer(
        child: ListTile(
          title: buildLoadingAnimation(context),
          subtitle: buildLoadingAnimation(context),
        ),
      ),
    ]);
  }

  Widget buildLoadingAnimation(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      height: 60,
      margin: const EdgeInsets.only(
        top: cDefaultPadding / 2,
        bottom: cDefaultPadding / 3,
      ),
    );
  }
}
