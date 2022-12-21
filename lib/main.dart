import 'package:untitled1/components/button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled1/components/drawer.dart';
import 'package:untitled1/widgets/check_password.dart';
import 'package:untitled1/widgets/gene_password.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,home: MyApp()  ));
}

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:  Colors.blue.shade900,
          title: Text('Home')  ),
        drawer:drawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              button(title: 'Generate Password',page: generate())
       ,Divider(color:Colors.transparent),
           button(title: 'Check Password Strength', page: check())
            ],
          ),
        ),
      )
    );
  }
}

