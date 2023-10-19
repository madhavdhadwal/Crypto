import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/app_bar.dart';
import '../../constants.dart';
import '../widgets/crypto_data.dart';
import '../../business_logic/data_bloc_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataBloc dataBloc = DataBlocProvider.of(context);
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SearchBar(),
            SizedBox(
              height: cDefaultPadding / 2,
            ),
            CryptoData(),
          ],
        ),
      ),
      floatingActionButton: showFab ? buildFloatingButton(dataBloc) : null,
    );
  }

  Widget buildFloatingButton(DataBloc dataBloc) {
    return FloatingActionButton(
      backgroundColor: cPrimaryColor,
      child: const Icon(
        Icons.refresh,
        color: cBackgroundColor,
      ),
      onPressed: () => dataBloc.refreshData(),
    );
  }
}
