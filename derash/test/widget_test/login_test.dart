
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:derash/screens/login.dart';

void main(){
  testWidgets('test for login page', (WidgetTester tester) async{

Widget testWidget =MediaQuery(
  data:MediaQueryData(),child:MaterialApp(home:LoginScreen())
);
await tester.pumpWidget(MaterialApp(home:LoginScreen(),));

var textFormField=find.byType(TextFormField);
expect(textFormField, findsOneWidget);
await tester.enterText(textFormField, "hey");
expect(find.text("hey"),findsOneWidget);

final passwordTextFormField = find.descendant(
  of: find.byKey(const Key('passwordTextFormField')),
  matching: find.byType(EditableText),
);
final input = tester.widget<EditableText>(passwordTextFormField);
expect(input.obscureText, isTrue);


var submitButton = find.textContaining('Log in');
    expect(submitButton, findsOneWidget);

    await tester.tap(submitButton);
    await tester.pump();


  });
}