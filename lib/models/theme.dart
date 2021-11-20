import 'package:fluent_ui/fluent_ui.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  micaBackgroundColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.transparent,
  activeColor: Colors.transparent,
  inactiveColor: Colors.transparent,
  inactiveBackgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  disabledColor: Colors.transparent,
  accentColor: AccentColor('cyan', {'cyan': Color.fromARGB(255, 76, 194, 255)}),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(TextStyle(color: Colors.white)),
    selectedTextStyle: ButtonState.all(TextStyle(color: Colors.white)),
    labelPadding: EdgeInsets.only(left: 10),
    iconPadding: EdgeInsets.only(left: 10),
    animationDuration: Duration(milliseconds: 200),
    tileColor: ButtonState.all(Colors.transparent),
  ),
);

class ThemeModel extends ChangeNotifier {
  var theme = darkTheme;

  void changeTheme(String mode) {
    switch (mode) {
      case "light":
        {
          theme = ThemeData.light();
          break;
        }
      case "dark":
        {
          theme = ThemeData.dark();
          break;
        }
    }
  }
}
