import 'package:fluent_ui/fluent_ui.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    inactiveBackgroundColor: Colors.grey.withOpacity(0.1),
    accentColor: Colors.red,
    acrylicBackgroundColor: Colors.red,
    buttonTheme: ButtonThemeData(
      iconButtonStyle: ButtonStyle(),
    ),
    navigationPaneTheme: NavigationPaneThemeData(
        backgroundColor: Colors.grey,
        unselectedTextStyle: ButtonState.all(TextStyle(color: Colors.white))));

class ThemeModel extends ChangeNotifier {
  var theme = ThemeData.dark();

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
