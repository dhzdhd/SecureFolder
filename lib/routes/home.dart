import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:secure_folder/routes/pages/add.dart';
import 'package:secure_folder/routes/pages/new.dart';
import 'package:secure_folder/routes/pages/help.dart';
import 'package:secure_folder/routes/pages/settings.dart';
import 'package:secure_folder/widgets/window_titlebar_buttons.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int? index;

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

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: MoveWindow(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Secure Folder',
              style: TextStyle(fontFamily: 'Segoe'),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: MoveWindow(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Spacer(), WindowButtons()],
          ),
        ),
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        items: [
          PaneItemSeparator(),
          PaneItem(
            icon: Icon(FluentIcons.new_folder),
            title: Text('Make a new folder'),
          ),
          PaneItem(
            icon: Icon(FluentIcons.add_in),
            title: Text('Add files to folder'),
          ),
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(icon: Icon(FluentIcons.help), title: Text('Help')),
          PaneItem(icon: Icon(FluentIcons.settings), title: Text('Settings')),
          PaneItemSeparator()
        ],
      ),
      content: NavigationBody(
        index: index ?? 0,
        children: [
          NewPage(),
          AddPage(),
          HelpPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
