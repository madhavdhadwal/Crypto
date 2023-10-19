import '../models/order_model.dart';
import '../models/data_model.dart';
import '../data_providers/data_api_provider.dart';

class DataRepository {
  List<Source> sources = <Source>[
    DataApiProvider(),
  ];

  Future<DataModel> fetchTicker(String value) async {
    DataModel? data;
    Source source;

    for (source in sources) {
      data = await source.fetchTicker(value);
      if (data != null) {
        break;
      }
    }
    return data!;
  }

  Future<OrderModel> fetchOrderBook(String value) async {
    OrderModel? order;
    Source source;

    for (source in sources) {
      order = await source.fetchOrderBook(value);
      if (order != null) {
        break;
      }
    }
    return order!;
  }
}

abstract class Source {
  Future<DataModel?> fetchTicker(String value);
  Future<OrderModel?> fetchOrderBook(String value);
}
