import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' show Window, WindowEffect;
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/color_dialog.dart';
import 'package:secure_folder/widgets/expander.dart';
import 'package:secure_folder/widgets/icons.dart';

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
        header: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 30),
          ),
        ),
        content: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Flexible(
                child: ExpanderWidget(
                  leading: CustomIcons.palette,
                  header: const Text('Change theme'),
                  content: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(child: Text('Switch theme')),
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
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ColorDialogWidget('bg')),
                                style: ButtonStyle(
                                  backgroundColor:
                                      ButtonState.all(model.accentColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(child: Text('Text accent color')),
                            SizedBox(
                              width: 100,
                              child: Button(
                                child: Text(
                                  'Color',
                                  style:
                                      TextStyle(color: model.accentTextColor),
                                ),
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ColorDialogWidget('text')),
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
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
