import 'package:crypto/data_constants.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'presentation/screens/home_screen.dart';
import 'business_logic/data_bloc_provider.dart';
import 'presentation/screens/unknown_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: DataConstants.appName,
        theme: ThemeData(
          fontFamily: DataConstants.fontFamily,
          scaffoldBackgroundColor: cPrimaryMaterialColor,
          primaryColor: cPrimaryColor,
          primarySwatch: cPrimaryMaterialColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: cTextColor,
                fontFamily: DataConstants.fontFamily,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          final DataBloc dataBloc = DataBlocProvider.of(context);
          dataBloc.orderState(false);
          return const HomeScreen();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return const UnknownScreen();
        },
      );
    }
  }
}
