import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/routes/pages/add.dart';
import 'package:secure_folder/routes/pages/new.dart';
import 'package:secure_folder/routes/pages/help.dart';
import 'package:secure_folder/routes/pages/settings.dart';
import 'package:secure_folder/widgets/icons.dart';
import 'package:secure_folder/widgets/pane_item.dart';
import 'package:secure_folder/widgets/window_titlebar_buttons.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final username = Platform.environment['USERNAME']!;
  final Map<int, bool> indexedDict = {0: true, 1: false, 2: false, 3: false};
  int index = 0;

  @override
  void initState() {
    super.initState();
    ThemeModel().setWindowEffect('dark');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return NavigationView(
        contentShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        appBar: NavigationAppBar(
          height: 0,
          // title: MoveWindow(
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Padding(
          //       padding: EdgeInsets.only(left: 0),
          //       child: Text(
          //         'Secure Folder',
          //       ),
          //     ),
          //   ),
          // ),
          // automaticallyImplyLeading: false,
          // actions: MoveWindow(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          // children: [Spacer(), WindowButtons()],
          //   ),
          // ),
        ),
        pane: NavigationPane(
          header: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CustomIcons.profile,
                ),
                Expanded(
                  child: Text(
                    username.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          selected: index,
          onChanged: (i) => setState(() {
            index = i;
            for (var _ = 0; _ < indexedDict.length; _++) {
              indexedDict[_] = false;
            }
            indexedDict[i] = true;
          }),
          items: [
            PaneItemWidget(
              icon: CustomIcons.new_,
              title: Text('Make a new folder'),
              isSelected: indexedDict[0]!,
            ),
            PaneItemWidget(
              icon: CustomIcons.addFolder,
              title: Text('Add files to folder'),
              isSelected: indexedDict[1]!,
            ),
          ],
          footerItems: [
            PaneItemWidget(
              icon: CustomIcons.help,
              title: Text('Help'),
              isSelected: indexedDict[2]!,
            ),
            PaneItemWidget(
              icon: CustomIcons.settings,
              title: Text('Settings'),
              isSelected: indexedDict[3]!,
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
