import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? comboBoxValue;

  @override
  void initState() {
    super.initState();
    this.setWindowEffect();
  }

  void setWindowEffect() {
    Window.setEffect(
      effect: WindowEffect.mica,
      dark: true,
    );
  }

  void onChanged(Object? value) {}

  @override
  Widget build(BuildContext context) {
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
                  child: Mica(
                child: ListTile(
                  leading: Icon(FluentIcons.color),
                  title: Text('Change theme'),
                  trailing: Combobox(
                    // isExpanded: true,
                    value: comboBoxValue,
                    // onChanged: (value) => onChanged(value),
                    items: [
                      ComboboxItem(
                        child: Text('Heleko'),
                        onTap: () => print(''),
                      ),
                      ComboboxItem(
                        child: Text('Heleko'),
                        onTap: () => print(''),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
