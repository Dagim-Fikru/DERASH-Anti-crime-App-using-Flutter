
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:derash/screens/signup.dart';


void main(){
  testWidgets('test for signup  page', (WidgetTester tester) async{

Widget testWidget =MediaQuery(
  data:MediaQueryData(),child:MaterialApp(home:SignUpScreen())
);
await tester.pumpWidget(MaterialApp(home:SignUpScreen(),));

var textFormField=find.byType(TextFormField);
expect(textFormField, findsOneWidget);
await tester.enterText(textFormField, "hello");
expect(find.text("hello"),findsOneWidget);



final passwordTextFormField = find.descendant(
  of: find.byKey(const Key('passwordTextFormField')),
  matching: find.byType(EditableText),
);
final input = tester.widget<EditableText>(passwordTextFormField);
expect(input.obscureText, isTrue);

var submitButton = find.textContaining('Register');
    expect(submitButton, findsOneWidget);

    await tester.tap(submitButton);
    await tester.pump();




  });
}