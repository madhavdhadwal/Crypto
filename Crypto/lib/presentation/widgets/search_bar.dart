import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../business_logic/data_bloc_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBloc dataBloc = DataBlocProvider.of(context);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
      height: 56,
      decoration: BoxDecoration(
          color: cSearchColor, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        onChanged: dataBloc.changeInput,
        cursorColor: cTextColor,
        decoration: const InputDecoration(
          hintText: 'Enter currency pair',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: cTextColor),
        ),
      ),
    );
  }
}