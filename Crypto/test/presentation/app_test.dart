import 'package:crypto/main.dart';
import 'package:crypto/presentation/widgets/add_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App has a searchbox to search the crypto pair',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Enter a supported currency pair to load data'),
        findsOneWidget);
  });

  testWidgets('Shimmer has a child widget', (WidgetTester tester) async {
    const childWidget = ListTile(
      title: Text('Loading'),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddShimmer(child: childWidget),
        ),
      ),
    );
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
