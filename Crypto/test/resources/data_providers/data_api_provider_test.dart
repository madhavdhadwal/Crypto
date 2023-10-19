import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:crypto/resources/data_providers/data_api_provider.dart';

void main() {
  test('fetchTicker returns a DataModel object', () async {
    final dataApi = DataApiProvider();
    dataApi.client = MockClient((request) async {
      final jsonMap = {
        'last': '46671',
        'high': '48304',
        'low': '46259',
        'vwap': '4125',
        'volume': '1358.029745668',
        'bid': '46570',
        'ask': '46570',
        'timestamp': '34323',
        'open': '46671'
      };
      return Response(json.encode(jsonMap), 200);
    });
    final data = await dataApi.fetchTicker('btcusd');
    expect(data!.last, '46671');
    expect(data.high, '48304');
    expect(data.open, '46671');
    expect(data.low, '46259');
    expect(data.volume, '1358.029745668');
  });

  test('fetchOrderBook returns a OrderModel object', () async {
    final dataApi = DataApiProvider();
    dataApi.client = MockClient((request) async {
      final jsonMap = {
        'timestamp': '34323',
        'microtimestamp': '34343',
        'bids': [['234','436']],
        'asks': [['245','457']]
      };
      return Response(json.encode(jsonMap), 200);
    });
    final data = await dataApi.fetchOrderBook('btcusd');
    expect(data!.bids, [['234','436']]);
    expect(data.asks, [['245','457']]);
  });
}
