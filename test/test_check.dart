import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/providers/providers.dart';
import 'package:untitled1/widgets/check_password.dart';

void main() {
  testWidgets('Ok generate page', (tester) async{
    await tester.pumpWidget(MaterialApp(home: check()  ));
    expect(find.byType(TextFormField),findsWidgets);
    expect(find.text('Check_Password'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField),'gerhrhhrehe');
    await tester.pumpAndSettle().whenComplete(() => print('done'));
  });
  test('check', () async{
   double d=Providers().password.checkPassword(password: 'see');
    expect(d,lessThan(0.3));
  });
}