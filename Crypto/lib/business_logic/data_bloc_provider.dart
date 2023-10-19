import 'package:flutter/material.dart';

import 'data_bloc.dart';
export 'data_bloc.dart';

class DataBlocProvider extends InheritedWidget {
  final DataBloc bloc;

  DataBlocProvider({Key? key, Widget? child})
      : bloc = DataBloc(),
        super(key: key, child: child!);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static DataBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataBlocProvider>()!.bloc;
  }
}
