

import 'package:flutter/material.dart';

class CustomScaleTransition extends PageRouteBuilder{
   CustomScaleTransition(
    {required this.child}
   ):super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds:1),
    pageBuilder: (context,animation,secondaryAnimation)=>child
   );

   final Widget child;

   @override
   Widget buildTransitions(BuildContext context,Animation<double> animation, Animation<double> secondaryAnimation,Widget child)=>
        ScaleTransition(scale: animation,
        child: child,
        )
        ;
}

