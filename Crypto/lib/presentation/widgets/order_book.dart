import 'package:crypto/data_constants.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'loading_order_book.dart';
import '../../business_logic/data_bloc_provider.dart';
import '../../resources/models/order_model.dart';

class OrderBook extends StatelessWidget {
  final DataBloc dataBloc;
  final String ackw;

  const OrderBook({
    Key? key,
    required this.dataBloc,
    required this.ackw,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: dataBloc.currOState,
      builder: (BuildContext context, AsyncSnapshot<bool> orderState) {
        if (!orderState.hasData || !orderState.data!) {
          return orderBookLogic(dataBloc, true, DataConstants.showText);
        }
        return StreamBuilder<Map<String, Future<OrderModel>>>(
          stream: dataBloc.order,
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, Future<OrderModel>>> cacheMap) {
            if (!cacheMap.hasData) {
              return const LoadingOrderBook();
            }
            return FutureBuilder<OrderModel>(
              future: cacheMap.data![ackw],
              builder: (BuildContext context, AsyncSnapshot<OrderModel> order) {
                if (!order.hasData) {
                  return const LoadingOrderBook();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    orderBookLogic(dataBloc, false, DataConstants.hideText),
                    const SizedBox(
                      height: cDefaultPadding / 2,
                    ),
                    orderBookContent(context, order.data!),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget orderBookLogic(DataBloc dataBloc, bool state, String str) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding),
      child: InkWell(
        onTap: () => dataBloc.orderState(state),
        child: Text(
          '$str ${DataConstants.itemName}',
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: cPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orderBookContent(BuildContext context, OrderModel order) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: cDefaultPadding),
        child: Text(
          DataConstants.itemName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(cDefaultPadding / 2),
        ),
        elevation: 2.0,
        child: Container(
          margin: const EdgeInsets.only(bottom: cDefaultPadding),
          width: double.infinity,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: cBackgroundColor),
            child: DataTable(
              dataRowHeight: cDefaultPadding * 2,
              dividerThickness: 0.0,
              headingRowHeight: cDefaultPadding,
              columnSpacing: cDefaultPadding,
              columns: [
                orderBookHeader(DataConstants.col1, context),
                orderBookHeader(DataConstants.col2, context),
                orderBookHeader(DataConstants.col3, context),
                orderBookHeader(DataConstants.col4, context),
              ],
              rows: [
                for (var i = 0; i < 5; i++) orderBookData(order, i),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  DataColumn orderBookHeader(String label, BuildContext context) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: Theme.of(context).textTheme.caption!.fontSize),
      ),
    );
  }

  DataRow orderBookData(OrderModel order, int index) {
    return DataRow(
      cells: [
        for (var i = 0; i < 2; i++)
          DataCell(
            Text(order.bids[index][i]),
          ),
        for (var i = 1; i >= 0; i--)
          DataCell(
            Text(order.asks[index][i]),
          ),
      ],
    );
  }
}
