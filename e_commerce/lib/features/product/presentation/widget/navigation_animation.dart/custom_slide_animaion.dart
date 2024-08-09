

import 'package:flutter/material.dart';

class CustomSlideTransition extends PageRouteBuilder{
   CustomSlideTransition(
    {required this.child}
   ):super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds:1),
    pageBuilder: (context,animation,secondaryAnimation)=>child
   );

   final Widget child;

   @override
   Widget buildTransitions(BuildContext context,Animation<double> animation, Animation<double> secondaryAnimation,Widget child){
         const begin = Offset(1, 0);
         const end=Offset.zero;
          const curve = Curves.easeInCubic;
        var twin = Tween<Offset>(begin: begin,end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(twin),
                child: child );
   }
}

