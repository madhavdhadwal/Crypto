import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(cDefaultPadding / 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
    );
  }
}
