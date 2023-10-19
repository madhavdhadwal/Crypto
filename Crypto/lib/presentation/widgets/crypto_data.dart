import 'package:flutter/material.dart';

import '../../business_logic/data_bloc_provider.dart';
import '../../constants.dart';
import '../../resources/models/data_model.dart';
import 'home_content.dart';
import 'home_header.dart';
import 'loading_build_page.dart';
import 'order_book.dart';

class CryptoData extends StatelessWidget {
  const CryptoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBloc dataBloc = DataBlocProvider.of(context);
    return StreamBuilder<String>(
      stream: dataBloc.processedInput,
      builder: (BuildContext context, AsyncSnapshot<String> ackw) {
        if (!ackw.hasData) {
          return showIdle();
        }
        return StreamBuilder<Map<String, Future<DataModel>>>(
          stream: dataBloc.data,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, Future<DataModel>>> cache) {
            if (!cache.hasData) {
              return const LoadingBuildPage();
            }
            return FutureBuilder<DataModel>(
              future: cache.data![ackw.data],
              builder: (BuildContext context, AsyncSnapshot<DataModel> data) {
                if (!data.hasData) {
                  return const LoadingBuildPage();
                }
                return buildPage(dataBloc, data.data!, ackw.data!);
              },
            );
          },
        );
      },
    );
  }

  //HomeScreen without data ->
  Widget showIdle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: cDefaultPadding * 2,
        ),
        Image.asset(
          'assets/images/search_icon.png',
          scale: 2,
        ),
        const SizedBox(
          height: cDefaultPadding * 2,
        ),
        const Text(
          'Enter a supported currency pair to load data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  //HomeScreen with data ->
  Widget buildPage(DataBloc dataBloc, DataModel data, String ackw) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        HomeHeader(ackw: ackw.toUpperCase(), data: data),
        HomeContent(data: data),
        OrderBook(
          dataBloc: dataBloc,
          ackw: ackw,
        ),
      ],
    );
  }
}
