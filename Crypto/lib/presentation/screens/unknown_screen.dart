import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text('Something went wrong. Please refresh the app'),)
    );
  }
}
