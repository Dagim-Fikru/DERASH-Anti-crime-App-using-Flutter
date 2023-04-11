import 'dart:html';
// import 'package:flutter_test'
// import 'package:derash/auth/signup/sign_up_state.dart';
import 'package:derash/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/scheduler.dart';
// import 'package:derash/screens
import 'package:derash/screens/login.dart';
import 'package:derash/screens/signup.dart';
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  var ensureInitialized = WidgetsFlutterBinding.ensureInitialized();
  testWidgets("integerate test", ((WidgetTester tester) async {
    await tester.pumpWidget(LoginScreen());
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 1));

    final Finder userText = find.byType(TextFormField);
    final Finder passtext = find.byType(TextFormField);

    expect(userText, findsOneWidget);
    expect(passtext, findsOneWidget);
    //enetr text

    await tester.enterText(userText, 'test@test.com');
    await tester.enterText(passtext, 'password*');
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));
//tap btn

    final Finder loginBtn = find.byType(Text);
    final Finder sign_inBtn = find.byType(Text);
    final Finder sign_upBtn = find.byType(Text);
    await tester.tap(loginBtn, warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));

    // LoginScreen state = tester.state(find.byType(LoginScreen));
    // expect(state.isloggedInState.Value ,true );
    // await tester.pump(Duration(seconds: 2));

    Navigator.pop;
    await tester.pumpAndSettle();

    // expect(find.byWidgetPredicate((widget) => false), matcher)

    // SignUpScreen state = tester.state(find.byType(SignUpScreen));
  }));
}
