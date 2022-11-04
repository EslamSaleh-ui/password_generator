import 'dart:io';
import 'package:untitled1/components/button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled1/providers/methods.dart';
import 'package:share_plus/share_plus.dart';
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
        drawer: Drawer(backgroundColor: Colors.white
            ,child: Column(children: [ Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ), width:double.infinity ,
                color: Colors.white,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center
                    ,children:[
                  DrawerHeader(child: Container(
                          height:100,
                          width:MediaQuery.of(context).size.width/2 ,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width:7), boxShadow: [
                              BoxShadow( color: Colors.grey.shade400,
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0,8)
                              )],
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:  AssetImage('asset/ic_launcher.png'),
                            ), ) )),
                  Text('Password_Generator',style: TextStyle(fontSize: 20),)
                  ,Divider(height: 5,color: Colors.transparent)
                ]) ),Expanded(child:
            ListView(children: [
              ListTile(title: Text('Help and Feedback'),onTap: ()  {help();}),
              ListTile(title: Text('Share App'),onTap: ()  {
                Share.share(Platform.isAndroid? "https://play.google.com/store/apps/details?id=${'com.example.untitled1'}":"https://apps.apple.com/app/id${'com.example.untitled1'}");
              }),
              ListTile(title: Text('Rate App'),onTap: ()  {rate();})
            ]   ))
            ]  )),
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

