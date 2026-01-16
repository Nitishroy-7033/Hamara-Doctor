import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamara_doctor/main.dart';

void main() {
  testWidgets('Splash screen shows smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HamaraDoctorApp());

    // Verify that splash text is shown
    expect(find.text('Hamara Doctor'), findsOneWidget);
  });
}
