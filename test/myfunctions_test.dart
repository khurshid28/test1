import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:test1/main.dart';

void main() {
  // test("Add test", () {
  //   int a = 5;
  //   int b = 13;
  //   expect(add(a, b), 18);
  // });

  group("Unit group test >>", () {
    test("add test 1", () {
      int a = 5;
      int b = 13;
      expect(add(a, b), 18);
    });
    test("add test 2", () {
      int a = 6;
      int b = 13;
      expect(add(a, b), 19);
    });

    test("https://jsonplaceholder.typicode.com/posts", () async {
      Response response =
          await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      expect(response.statusCode, 200,skip: "200 keldi");
      expect((await jsonDecode(response.body)) is List, true,skip:"List data keldi");

    });
  });

  testWidgets("Widget test group", (WidgetTester tester) async{
     await tester.pumpWidget(const MyApp());

     var button = find.byType(FloatingActionButton);
     expect(button, findsOneWidget);
     await tester.tap(button);
     await tester.pumpAndSettle();
    var counter = find.byKey(const Key("counter"));
    expect(counter, findsOneWidget);
    expect((counter.evaluate().first.widget as Text).data, "1");
    
    

  });
}
