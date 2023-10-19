class DataModel {
  final String last;
  final String high;
  final String low;
  final String vwap;
  final String volume;
  final String bid;
  final String ask;
  final DateTime timestamp;
  final String open;

  DataModel(this.last, this.high, this.low, this.vwap, this.volume, this.bid,
      this.ask, this.timestamp, this.open);

  DataModel.fromJson(Map<String, dynamic> parsedJson)
      : last = parsedJson['last'].toString(),
        high = parsedJson['high'].toString(),
        low = parsedJson['low'].toString(),
        vwap = parsedJson['vwap'].toString(),
        volume = parsedJson['volume'].toString(),
        bid = parsedJson['bid'].toString(),
        ask = parsedJson['ask'].toString(),
        timestamp = DateTime.now()
            .add(Duration(microseconds: int.parse(parsedJson['timestamp']))),
        open = parsedJson['open'].toString();


  Map<String, dynamic> _toMap() {
    return {
      'last': last,
      'high': high,
      'low': low,
      'vwap': vwap,
      'volume': volume,
      'bid': bid,
      'ask': ask,
      'timestamp': timestamp,
      'open': open,
    };
  }

  dynamic get(String propertyName) {
    var _mapData = _toMap();
    if (_mapData.containsKey(propertyName)) {
      return _mapData[propertyName];
    }
    throw ArgumentError('Property not found');
  }
}
