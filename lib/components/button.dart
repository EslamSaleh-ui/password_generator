import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class button extends StatelessWidget {
  final String title;
  final Widget page;
  final Function function;
  const button({@required this.title, this.page,this.function, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return   function==null? NeumorphicButton(style:NeumorphicStyle( shape: NeumorphicShape.concave,
       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
       depth: 8,surfaceIntensity: 1,
       lightSource: LightSource.topLeft,
       color: Colors.blue.shade900) ,
     child: Text(this.title,style: TextStyle(color: Colors.white)),
     onPressed:(){Navigator.push(context,PageAnimationTransition(page:this.page,
         pageAnimationType:BottomToTopTransition() ));} ,
   ):NeumorphicButton(style:NeumorphicStyle( shape: NeumorphicShape.concave,
       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
       depth: 8,surfaceIntensity: 1,
       lightSource: LightSource.topLeft,
       color: Colors.blue.shade900) ,
     child: Text(this.title,style: TextStyle(color: Colors.white)),
     onPressed:(){this.function.call();} ,
   );
  }
}