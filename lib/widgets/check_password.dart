<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
>>>>>>> e547e8e (welcome pg)
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled1/providers/providers.dart';
import 'package:provider/provider.dart';

class check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>Providers(),
    builder:(context,providers){
    final p=Provider.of<Providers>(context);
   return Scaffold(
     appBar: AppBar(
         centerTitle: true,
         backgroundColor:  Colors.blue.shade900,
         title: Text('Check_Password')  ),
     body:Column(
       children: [
         Divider(color:Colors.transparent),
         Padding(padding: const EdgeInsets.only(top:10,right: 5,left:5,bottom:10),child:TextFormField(
             keyboardType: TextInputType.text,
             validator:(f){
               if(f.isEmpty)
                 return 'This Field is needed';
               return null;
             } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
             style:const TextStyle(fontSize: 25,color: Colors.black) ,
             decoration: InputDecoration(hintText :'Enter your password',
                 hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                 enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black) )
                 , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red) )
                 ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red) )
                 ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black) ))
        ,onFieldSubmitted: (h){p.check(p.password.checkPassword(password: h));} )),Divider(height: 100,color:Colors.transparent),
         Selector<Providers,String>(
             selector: (context,p2)=>p2.check_password,
             builder:(context,roviders,child){
               return  NeumorphicText(
                   roviders,
                   style: NeumorphicStyle(
                       depth: 8,
                       color: Colors.black),
                   textStyle: NeumorphicTextStyle(
                       fontSize: 35  ));  }
         )
       ]
     ) ,
   );});
  }
}