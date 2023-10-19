import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../../presentation/widgets/custom_exception.dart';
import '../models/data_model.dart';
import '../models/order_model.dart';
import '../repositories/data_repository.dart';

const _root = 'www.bitstamp.net';

class DataApiProvider implements Source {
  Client client = Client();

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Future<DataModel?> fetchTicker(String value) async {
    try {
      final url = Uri.https(_root, '/api/v2/ticker/$value');
      final response = await client.get(url, headers: requestHeaders);
      final parsedJsonRes = json.decode(response.body);
      final DataModel data = DataModel.fromJson(parsedJsonRes);
      return data;
    } catch (e) {
      if (e is SocketException) {
        throw CustomException('No Internet connection');
      } else if (e is TimeoutException) {
        throw CustomException('Server Timeout');
      } else {
        throw CustomException(e.toString());
      }
    }
  }

  @override
  Future<OrderModel?> fetchOrderBook(String value) async {
    try {
      final url = Uri.https(_root, '/api/v2/order_book/$value');
      final response = await client.get(url, headers: requestHeaders);
      final parsedJsonOrder = json.decode(response.body);
      final OrderModel order = OrderModel.fromJson(parsedJsonOrder);
      return order;
    } catch (e) {
      if (e is SocketException) {
        throw CustomException('No Internet connection');
      } else if (e is TimeoutException) {
        throw CustomException('Server Timeout');
      } else {
        throw CustomException(e.toString());
      }
    }
  }
}
