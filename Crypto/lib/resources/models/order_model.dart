class OrderModel {
  final DateTime timestamp;
  final DateTime microtimestamp;
  final List<dynamic> bids;
  final List<dynamic> asks;

  OrderModel(this.timestamp, this.microtimestamp, this.bids, this.asks);

  OrderModel.fromJson(Map<String, dynamic> parsedJson)
      : timestamp = DateTime.now()
            .add(Duration(microseconds: int.parse(parsedJson['timestamp']))),
        microtimestamp = DateTime.now()
            .add(Duration(microseconds: int.parse(parsedJson['microtimestamp']))),
        bids = parsedJson['bids'] ?? [],
        asks = parsedJson['asks'] ?? [];
}
