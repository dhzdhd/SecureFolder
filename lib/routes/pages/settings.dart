import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' show Window, WindowEffect;
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

enum Theme { light, dark }

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Theme? comboBoxValue;

  @override
  void initState() {
    super.initState();
    Window.setEffect(
      effect: WindowEffect.mica,
      dark: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return ScaffoldPage(
        header: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 30),
          ),
        ),
        content: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            child: Column(
              children: [
                Flexible(
                  child: Expander(
                    headerBackgroundColor: model.secondaryColor,
                    contentBackgroundColor: model.secondaryColor,
                    headerHeight: 70,
                    content: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(child: Text('Switch theme')),
                              SizedBox(
                                width: 100,
                                child: Combobox<Theme>(
                                  value: comboBoxValue,
                                  onChanged: (value) async {
                                    setState(() {
                                      comboBoxValue = value;
                                    });
                                    if (value == Theme.light) {
                                      Provider.of<ThemeModel>(context,
                                              listen: false)
                                          .changeTheme('light');
                                    } else {
                                      Provider.of<ThemeModel>(context,
                                              listen: false)
                                          .changeTheme('dark');
                                    }
                                  },
                                  items: [
                                    ComboboxItem<Theme>(
                                      value: Theme.light,
                                      child: Text('Light'),
                                    ),
                                    ComboboxItem<Theme>(
                                      value: Theme.dark,
                                      child: Text('Dark'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(child: Text('Accent color')),
                              SizedBox(
                                width: 100,
                                child: Button(
                                  child: Text(
                                    'Color',
                                    style:
                                        TextStyle(color: model.accentTextColor),
                                  ),
                                  onPressed: () => null,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        ButtonState.all(model.accentColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    leading: Icon(FluentIcons.color),
                    header: Text('Change theme'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
