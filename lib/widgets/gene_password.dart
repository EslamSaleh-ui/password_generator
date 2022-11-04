import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:counter_button/counter_button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/components/button.dart';
import 'package:untitled1/providers/providers.dart';
import 'package:toast/toast.dart';

class generate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return  ChangeNotifierProvider(create: (context)=>Providers(),
        builder:(context,providers){
          final p=Provider.of<Providers>(context);

          return Scaffold(  appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.blue.shade900,
        title: Text('Generate_Password') ,actions: [IconButton(onPressed:(){
       FlutterClipboard.copy( p.gen_password);
       Toast.show('Password Copied to Clipboard',gravity: Toast.bottom,duration: Toast.lengthLong);
    }, icon:Icon(FontAwesomeIcons.copy))] ),
    body:Center(child:
    Column(
      children: [
        Divider(color:Colors.transparent),
        Selector<Providers,String>(
          selector: (context,p2)=>p2.gen_password,
          builder:(context,roviders,child){
            return  NeumorphicText(
                roviders,
                style: NeumorphicStyle(
                depth: 8,
                color: Colors.black),
            textStyle: NeumorphicTextStyle(
            fontSize: 35  ));  }
        ),
        Divider(color:Colors.transparent),
        Wrap(children: [
          ListTile(leading:Checkbox(value:p.upper , onChanged: (v) { p.upper_case( v ); }) ,title: Text('Upper case')  ),
          ListTile(leading:Checkbox(value:p.lower , onChanged: (v) { p.lower_case( v ); }) ,title: Text('Lower case')  )
,          ListTile(leading:Checkbox(value:p.number , onChanged: (v) { p.numbers( v ); }) ,title: Text('Numbers')  )
,          ListTile(leading:Checkbox(value:p.symbol , onChanged: (v) { p.symbols( v ); }) ,title: Text('Symbols')  )
       ] ,crossAxisAlignment: WrapCrossAlignment.center,spacing: 4),
        Divider(color:Colors.transparent),
        Text('Password Length',style: TextStyle(fontWeight: FontWeight.w900)),
        Divider(color:Colors.transparent),
        CounterButton(
          loading: false,
          onChange: (int val) {p.check_len( val);},
          count:p.password_len  ,
          buttonColor: Colors.blue.shade900,
        ),
        Divider(height: 100,color:Colors.transparent),
       button(title: 'Generate Password',function: (){
         if(p.password_len<1)
           Toast.show('Password Length must be more than 1',gravity: Toast.bottom,duration: Toast.lengthLong);
         else{
           String newPassword = p.password.randomPassword(uppercase: p.upper,numbers: p.number,letters: p.lower,specialChar: p.symbol,passwordLength: p.password_len.toDouble());
           p.generate(newPassword);}
       })
      ]
    )));
        });
  }
}