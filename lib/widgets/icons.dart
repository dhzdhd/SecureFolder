import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons {
  static final add = setSize(SvgPicture.asset('assets/icons/add.svg'));
  static final palette = setSize(SvgPicture.asset('assets/icons/palette.svg'));
  static final settings =
      setSize(SvgPicture.asset('assets/icons/settings.svg'));

  static Widget setSize(SvgPicture child) {
    return SizedBox(
      child: child,
      height: 25,
      width: 25,
    );
  }
}
