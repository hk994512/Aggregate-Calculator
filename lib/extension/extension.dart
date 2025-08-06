import 'package:flutter/material.dart';

extension ScreenRoutes on BuildContext {
  NavigatorState get src => Navigator.of(this);
  void pushSrc(Widget newSrc) {
    src.push(MaterialPageRoute(builder: (_) => newSrc));
  }

  void popSrc() => src.pop();
  void pushReplaceSrc(Widget newScr) =>
      src.pushReplacement(MaterialPageRoute(builder: (_) => newScr));
}

extension ScreenSizes on double {
  get ht => SizedBox(height: this);
  get wt => SizedBox(width: this);
}
