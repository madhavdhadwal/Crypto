import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../data_constants.dart';
import '../../resources/models/data_model.dart';

class HomeContent extends StatelessWidget {
  final DataModel data;

  const HomeContent({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Content -> 
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(
        cDefaultPadding,
        cDefaultPadding / 4,
        cDefaultPadding,
        0.0,
      ),
      itemCount: DataConstants.dataToShow.length,
      itemBuilder: (context, index) {
        String valFetched = DataConstants.dataToShow[index];
        return showParams(valFetched, data, context);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.1,
      ),
    );
  }

  //Params within content ->
  Widget showParams(String valFetched, DataModel data, BuildContext context) {
    bool showSymbol = valFetched == 'volume' ? false : true;
    return GridTile(
      header: paramTitle(valFetched.toUpperCase(), context),
      child: paramData(
        data.get(valFetched).toString(),
        showSymbol,
      ),
    );
  }

  Widget paramTitle(String val, BuildContext context) {
    return Text(
      val,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black54,
        fontSize: Theme.of(context).textTheme.caption!.fontSize,
      ),
    );
  }

  Widget paramData(String amount, bool showSymbol) {
    final formatCurrency = NumberFormat.currency(symbol: '\$ ');
    var formattedAmt =
        showSymbol ? formatCurrency.format(double.parse(amount)) : amount;
    return Container(
      margin: const EdgeInsets.only(
        top: cDefaultPadding / 1.5,
      ),
      child: Text(
        formattedAmt,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
  }
