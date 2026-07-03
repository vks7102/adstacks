import 'package:flutter_test/flutter_test.dart';
import 'package:adstacks/main.dart';

void main() {
  testWidgets('Dashboard renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const DashboardApp());
    expect(find.text('Home'), findsOneWidget);
  });
}
