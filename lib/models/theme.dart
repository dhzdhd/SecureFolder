import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

enum Theme { light, dark }

const globalAccentColor = Color.fromARGB(255, 76, 194, 255);

const lightPrimaryColor = Colors.white;
const lightSecondaryColor = Color.fromARGB(20, 0, 0, 0);
const lightTextColor = Colors.black;
const lightAccentTextColor = Colors.white;
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
    bodyPadding: const EdgeInsets.only(top: 10),
    actionsPadding: const EdgeInsets.only(top: 20, bottom: 20),
    decoration: BoxDecoration(
      color: lightPrimaryColor.withAlpha(180),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(const TextStyle(color: Colors.black)),
    selectedTextStyle: ButtonState.all(const TextStyle(color: Colors.black)),
    labelPadding: const EdgeInsets.only(left: 10),
    iconPadding: const EdgeInsets.only(left: 10),
    animationDuration: const Duration(milliseconds: 100),
    highlightColor: globalAccentColor,
  ),
);

const darkPrimaryColor = Colors.black;
const darkSecondaryColor = Color.fromARGB(20, 255, 255, 255);
const darkTextColor = Colors.white;
const darkAccentTextColor = Colors.black;
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
    bodyPadding: const EdgeInsets.only(top: 10),
    actionsPadding: const EdgeInsets.only(top: 20, bottom: 20),
    decoration: BoxDecoration(
      color: darkPrimaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(const TextStyle(color: Colors.white)),
    selectedTextStyle: ButtonState.all(const TextStyle(color: Colors.white)),
    labelPadding: const EdgeInsets.only(left: 10),
    iconPadding: const EdgeInsets.only(left: 10),
    animationDuration: const Duration(milliseconds: 100),
    highlightColor: globalAccentColor,
  ),
);

class ThemeModel extends ChangeNotifier {
  var theme = darkTheme;
  var accentColor = globalAccentColor;
  var primaryColor = darkPrimaryColor;
  var secondaryColor = darkSecondaryColor;
  var textColor = darkTextColor;
  var accentTextColor = darkAccentTextColor;

  Future<void> setWindowEffect(Theme mode) async {
    await Window.setEffect(
      effect: WindowEffect.mica,
      dark: mode == Theme.dark ? true : false,
    );
  }

  void changeAccentColor(Color color, String type) {
    type == 'text' ? accentTextColor = color : accentColor = color;
    notifyListeners();
  }

  void changeSecondaryColor(Color color) {
    secondaryColor = color;
    notifyListeners();
  }

  Future<void> changeTheme(Theme mode) async {
    switch (mode) {
      case Theme.light:
        {
          theme = lightTheme;
          accentColor = accentColor;
          primaryColor = lightPrimaryColor;
          secondaryColor = lightSecondaryColor;
          textColor = lightTextColor;
          accentTextColor = lightAccentTextColor;
          break;
        }
      case Theme.dark:
        {
          theme = darkTheme;
          accentColor = accentColor;
          primaryColor = darkPrimaryColor;
          secondaryColor = darkSecondaryColor;
          textColor = darkTextColor;
          accentTextColor = darkAccentTextColor;
          break;
        }
    }
    await setWindowEffect(mode);
    notifyListeners();
  }
}
