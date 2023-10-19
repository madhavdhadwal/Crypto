import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../data_constants.dart';
import '../resources/models/order_model.dart';
import '../resources/repositories/data_repository.dart';
import '../resources/models/data_model.dart';

class DataBloc {
  final repository = DataRepository();
  final _input = BehaviorSubject<String>();
  final _valid = PublishSubject<String>();
  final _forOrder = PublishSubject<String>();
  final _output = BehaviorSubject<Map<String, Future<DataModel>>>();
  final _orderState = PublishSubject<bool>();
  final _orderOutput = BehaviorSubject<Map<String, Future<OrderModel>>>();

  Stream<String> get processedInput =>
  _input.stream.transform(_validateInput());
  Stream<String> get inputVal => _input.stream;
  Stream<Map<String, Future<DataModel>>> get data => _output.stream;
  Stream<Map<String, Future<OrderModel>>> get order => _orderOutput.stream;
  Stream<bool> get currOState => _orderState.stream;

  Function(String) get changeInput => _input.sink.add;
  Function(String) get addValid => _valid.sink.add;
  Function(bool) get orderState => _orderState.sink.add;
  Function(String) get forOrder => _forOrder.sink.add;

  DataBloc() {
    _forOrder.stream.transform(_buildOrderMap()).pipe(_orderOutput);
    _valid.stream.transform(_validTransformer()).pipe(_output);
  }

  _validateInput() {
    return StreamTransformer<String, String>.fromHandlers(
        handleData: (userInput, sink) {
      if (userInput.length >= 6 && userInput.length <= 7) {
        if (DataConstants.getAllowedVal().contains(userInput)) {
          addValid(userInput);
          forOrder(userInput);
          sink.add(userInput);
        } else {
          sink.addError('Crypto pair not allowed');
        }
      } else {
        sink.addError('Crypto pair not allowed');
      }
    });
  }

  _validTransformer() {
    return ScanStreamTransformer<String, Map<String, Future<DataModel>>>(
        (cache, String id, index) {
      cache[id] = repository.fetchTicker(id);
      return cache;
    }, <String, Future<DataModel>>{});
  }

  _buildOrderMap() {
    return ScanStreamTransformer<String, Map<String, Future<OrderModel>>>(
        (cache, String id, index) {
      cache[id] = repository.fetchOrderBook(id);
      return cache;
    }, <String, Future<OrderModel>>{});
  }

  void refreshData() {
    addValid(_input.value);
    forOrder(_input.value);
  }

  dispose() {
    _input.close();
    _valid.close();
    _output.close();
  }
}
