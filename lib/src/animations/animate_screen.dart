import 'package:flutter/material.dart';

class PreviewSlideRoute extends PageRouteBuilder {
  Widget preview;
  int duration;
  PreviewSlideRoute({required this.preview, required this.duration})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) {
              return preview;
            },
            transitionDuration: Duration(milliseconds: duration),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return Align(
                  child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              ));
            });
  @override
  void dispose() {
    super.dispose();
  }
}
