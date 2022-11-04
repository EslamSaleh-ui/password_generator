import 'package:counter_button/counter_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled1/components/button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/providers/providers.dart';
import 'package:untitled1/widgets/gene_password.dart';

void main() {
  testWidgets('Ok generate page', (tester) async{
    await tester.pumpWidget(MaterialApp(home: generate()  ));
    expect(find.byType(CounterButton),findsWidgets);
    expect(find.byType(Checkbox),findsWidgets);
    expect(find.byType(button),findsWidgets);
    expect(find.text('Generate_Password'), findsOneWidget);
    await tester.tap(find.widgetWithText(NeumorphicButton,'Generate Password'));
      await tester.pumpAndSettle().whenComplete(() => print('done'));
  });
  test('generation', () async{
    String newPassword = Providers().password.randomPassword(uppercase: true,numbers:true,letters:true,specialChar: true,passwordLength:10);
    expect(newPassword.contains(RegExp(r'[0-9]')),true);
    expect(newPassword.contains(RegExp(r'[a-z]')),true);
    expect(newPassword.contains(RegExp(r'[A-Z]')),true);
  });
}