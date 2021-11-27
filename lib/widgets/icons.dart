import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons {
  static final addFolder =
      setSize(SvgPicture.asset('assets/icons/add-folder.svg'));
  static final folder =
      setSize(SvgPicture.asset('assets/icons/folder.svg'), 300);
  static final settings =
      setSize(SvgPicture.asset('assets/icons/settings.svg'));
  static final add = setSize(Image.asset('assets/icons/add.png'));
  static final changelog = setSize(Image.asset('assets/icons/changelog.png'));
  static final credits = setSize(Image.asset('assets/icons/credits.png'));
  static final creditsScaled =
      setSize(Image.asset('assets/icons/credits.png'), 300);
  static final help = setSize(Image.asset('assets/icons/help.png'));
  static final license = setSize(Image.asset('assets/icons/license.png'));
  static final new_ = setSize(Image.asset('assets/icons/new.png'));
  static final palette = setSize(Image.asset('assets/icons/palette.png'));

  static final profile = setSize(Image.asset('assets/icons/profile.png'));

  static Widget setSize(dynamic child, [double width = 25]) {
    return SizedBox(
      child: child,
      height: width,
      width: width,
    );
  }
}
