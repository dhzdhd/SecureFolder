import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons {
  static final add = setSize(SvgPicture.asset('assets/icons/add.svg'));
  static final settings =
      setSize(SvgPicture.asset('assets/icons/settings.svg'));
  static final help = setSize(Image.asset('assets/icons/help.png'));
  static final new_ = setSize(Image.asset('assets/icons/new.png'));
  static final palette = setSize(Image.asset('assets/icons/palette.png'));

  static Widget setSize(dynamic child) {
    return SizedBox(
      child: child,
      height: 300,
      width: 25,
    );
  }
}
