import 'package:flutter/material.dart';
import 'islemler.dart';

class AtaWidget extends InheritedWidget {
  final Islemler islem;
  AtaWidget({Key key, @required Widget child, this.islem})
      : super(key: key, child: child);
  static AtaWidget of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.inheritFromWidgetOfExactType(AtaWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
