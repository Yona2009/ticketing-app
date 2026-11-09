
import 'package:flutter_test/flutter_test.dart';
import 'package:ticketing_app/core/app.dart';

void main() {
  testWidgets('Ticketing app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const TicketingApp());

    expect(find.text('TICKETING'), findsOneWidget);
    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Featured Event'), findsOneWidget);
    expect(find.text('Popular Events'), findsOneWidget);
  });
}