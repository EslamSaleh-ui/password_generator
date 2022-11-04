import 'package:launch_review/launch_review.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

void help()async{
  final       url='mailto:eslam1995saleh@gmail.com?subject=Password_Generator&body= ';
  if (await canLaunch(url)) {
  await launch(url);
  }
  else
  Toast.show('45', gravity: Toast.bottom, duration: Toast.lengthLong);
}

void rate(){
  LaunchReview.launch(androidAppId: 'com.example.untitled1',iOSAppId:'com.example.untitled1' );
}