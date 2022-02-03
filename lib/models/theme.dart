import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

final globalAccentColor = Color.fromARGB(255, 76, 194, 255);

final lightPrimaryColor = Colors.white;
final lightSecondaryColor = Color.fromARGB(20, 0, 0, 0);
final lightTextColor = Colors.black;
final lightAccentTextColor = Colors.white;
final lightTheme = ThemeData(
  brightness: Brightness.light,
  micaBackgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.transparent,
  activeColor: Colors.transparent,
  inactiveColor: Colors.transparent,
  inactiveBackgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  disabledColor: Colors.transparent,
  accentColor: globalAccentColor.toAccentColor(),
  dialogTheme: ContentDialogThemeData(
    bodyPadding: EdgeInsets.only(top: 10),
    actionsPadding: EdgeInsets.only(top: 20, bottom: 20),
    decoration: BoxDecoration(
      color: lightPrimaryColor.withAlpha(180),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(TextStyle(color: Colors.black)),
    selectedTextStyle: ButtonState.all(TextStyle(color: Colors.black)),
    labelPadding: EdgeInsets.only(left: 10),
    iconPadding: EdgeInsets.only(left: 10),
    animationDuration: Duration(milliseconds: 150),
    tileColor: ButtonState.all(Colors.transparent),
  ),
);

final darkPrimaryColor = Colors.black;
final darkSecondaryColor = Color.fromARGB(20, 255, 255, 255);
final darkTextColor = Colors.white;
final darkAccentTextColor = Colors.black;
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  micaBackgroundColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.transparent,
  activeColor: Colors.transparent,
  inactiveColor: Colors.transparent,
  inactiveBackgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  disabledColor: Colors.transparent,
  accentColor: globalAccentColor.toAccentColor(),
  dialogTheme: ContentDialogThemeData(
    bodyPadding: EdgeInsets.only(top: 10),
    actionsPadding: EdgeInsets.only(top: 20, bottom: 20),
    decoration: BoxDecoration(
      color: darkPrimaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(TextStyle(color: Colors.white)),
    selectedTextStyle: ButtonState.all(TextStyle(color: Colors.white)),
    labelPadding: EdgeInsets.only(left: 10),
    iconPadding: EdgeInsets.only(left: 10),
    animationDuration: Duration(milliseconds: 150),
    tileColor: ButtonState.all(Colors.transparent),
  ),
);

class ThemeModel extends ChangeNotifier {
  var theme = darkTheme;
  var accentColor = globalAccentColor;
  var primaryColor = darkPrimaryColor;
  var secondaryColor = darkSecondaryColor;
  var textColor = darkTextColor;
  var accentTextColor = darkAccentTextColor;

  Future<void> setWindowEffect(String mode) async {
    await Window.setEffect(
      effect: WindowEffect.mica,
      dark: mode == 'dark' ? true : false,
    );
  }

  void changeAccentColor(Color color) {
    accentColor = color;
    notifyListeners();
  }

  void changeSecondaryColor(Color color) {
    secondaryColor = color;
    notifyListeners();
  }

  Future<void> changeTheme(String mode) async {
    switch (mode) {
      case 'light':
        {
          theme = lightTheme;
          accentColor = accentColor;
          primaryColor = lightPrimaryColor;
          secondaryColor = lightSecondaryColor;
          textColor = lightTextColor;
          accentTextColor = lightAccentTextColor;
          await setWindowEffect(mode);
          break;
        }
      case 'dark':
        {
          theme = darkTheme;
          accentColor = accentColor;
          primaryColor = darkPrimaryColor;
          secondaryColor = darkSecondaryColor;
          textColor = darkTextColor;
          accentTextColor = darkAccentTextColor;
          await setWindowEffect(mode);
          break;
        }
    }
    notifyListeners();
  }
}
