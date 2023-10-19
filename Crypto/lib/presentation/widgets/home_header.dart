import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../resources/models/data_model.dart';

class HomeHeader extends StatelessWidget {
  final String ackw;
  final DataModel data;
  
  const HomeHeader({Key? key, required this.ackw, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: cDefaultPadding, vertical: 0.0),
      dense: true,
      title: showCryptoPairName(ackw),
      trailing: showDate(data),
    );
  }

  Widget showCryptoPairName(String ackw) {
    return Text(
      ackw,
      style: const TextStyle(
        fontSize: 38,
      ),
    );
  }

  Widget showDate(DataModel data) {
    return Text(
      DateFormat.yMMMMd('en_US').add_jms().format(data.timestamp),
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
