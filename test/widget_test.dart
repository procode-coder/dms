import 'package:dms/modules/todo_app/presentation/view/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock ToDoBloc
void main() {
  testWidgets('Login page validation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CenteredButtonPage()));

    await tester.tap(find.text('Submit'));

    await tester.pump();

    expect(find.text("Please enter a title"), findsOneWidget);
    expect(find.text("Please enter a description"), findsOneWidget);
  });
}
