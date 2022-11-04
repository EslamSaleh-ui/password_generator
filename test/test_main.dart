import 'package:untitled1/components/button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/main.dart';

void main() {
  testWidgets('Ok main page', (tester) async{
    await tester.pumpWidget(MaterialApp(home: MyApp()  ));
    expect(find.byType(button),findsWidgets);
     expect(find.text('Home'), findsOneWidget);
      await tester.press(find.text('Generate Password'));
    await tester.pumpAndSettle();
      expect(find.byWidget(MyApp()), findsNothing);
    await tester.press(find.text('Check Password Strength'));
    await tester.pumpAndSettle();
    expect(find.byWidget(MyApp()), findsNothing);
  });
}