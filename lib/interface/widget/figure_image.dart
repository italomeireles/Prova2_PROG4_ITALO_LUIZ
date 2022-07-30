import 'package:flutter/cupertino.dart';

Widget figureImage(bool visible, String path, [String? tip]) {
  return Visibility(
      visible: visible,
      child: Container(
        width: 310,
        height: 310,
        child: Image.asset(path),
      ));
}
