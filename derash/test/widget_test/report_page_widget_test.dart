// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:derash/screens/reportPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test for report page', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: ReportScreen()));
    await tester.pumpWidget(MaterialApp(
      home: ReportScreen(),
    ));
    var dropDown = find.byType(DropdownButtonFormField<String>);
    expect(dropDown, findsOneWidget);
    await tester.tap(dropDown);
    await tester.pumpAndSettle();
    final dropdownItem = find.text('').last;
    await tester.tap(dropdownItem, warnIfMissed: false);
    await tester.pumpAndSettle();

    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsOneWidget);
    await tester.enterText(textFormField, 'Theft');
    expect(find.text('Theft'), findsOneWidget);

    expect(find.byIcon(Icons.insert_drive_file_rounded), findsOneWidget);
    expect(find.byIcon(Icons.camera_alt_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.insert_drive_file_rounded));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.camera_alt_rounded));
    await tester.pump();

    var submitButton = find.textContaining('Submit');
    expect(submitButton, findsOneWidget);

    await tester.tap(submitButton);
    await tester.pump();
    // expect(findsOneWidget,findsOneWidget);
  });
}
