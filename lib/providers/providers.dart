import 'package:flutter/foundation.dart';
import 'package:random_password_generator/random_password_generator.dart';


class Providers extends ChangeNotifier{
  final password = RandomPasswordGenerator();
  String gen_password='';
   String check_password='';
   int password_len=0;
   bool upper=false;
   bool lower=false;
   bool symbol=false;
   bool number=false;

   void upper_case(bool pp)
   {upper=pp;
   notifyListeners();}
   void lower_case(bool pp)
   {lower=pp;
   notifyListeners();}
   void symbols(bool pp)
   {symbol=pp;
   notifyListeners();}
   void numbers(bool pp)
   {number=pp;
   notifyListeners();}
 void generate(String p)
 {gen_password=p;
 notifyListeners();}
   void check(double c)
   {if (c < 0.3)
     check_password='This password is weak!';
   else if (c < 0.7)
     check_password='This password is Good';
   else
     check_password='This passsword is Strong';
   notifyListeners();}
   void check_len(int l)
   {password_len=l;
   notifyListeners();
   }
}