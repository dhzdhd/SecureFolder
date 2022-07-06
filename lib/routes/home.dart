import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/routes/pages/add.dart';
import 'package:secure_folder/routes/pages/new.dart';
import 'package:secure_folder/routes/pages/help.dart';
import 'package:secure_folder/routes/pages/settings.dart';
import 'package:secure_folder/widgets/icons.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final username = Platform.environment['USERNAME'] ?? 'Unknown user';
  int index = 0;

  @override
  void initState() {
    super.initState();
    ThemeModel().setWindowEffect(Theme.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return NavigationView(
        contentShape:
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        pane: NavigationPane(
          header: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomIcons.profile,
                ),
                Expanded(
                  child: Text(
                    username.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          selected: index,
          onChanged: (i) => setState(() {
            index = i;
          }),
          items: [
            PaneItem(
              icon: CustomIcons.new_,
              title: const Text('Make a new folder'),
            ),
            PaneItem(
              icon: CustomIcons.addFolder,
              title: const Text('Add files to folder'),
            ),
          ],
          footerItems: [
            PaneItem(
              icon: CustomIcons.help,
              title: const Text('Help'),
            ),
            PaneItem(
              icon: CustomIcons.settings,
              title: const Text('Settings'),
            ),
          ],
        ),
        content: NavigationBody(
          index: index,
          children: [
            NewPage(),
            AddPage(),
            HelpPage(),
            SettingsPage(),
          ],
        ),
      );
    });
  }
}
