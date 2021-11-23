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
          height: 36,
          title: MoveWindow(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Secure Folder',
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: MoveWindow(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Spacer(), WindowButtons()],
            ),
          ),
        ),
        pane: NavigationPane(
          header: SizedBox.shrink(),
          selected: index,
          onChanged: (i) => setState(() => index = i),
          items: [
            PaneItemWidget(
              icon: Icon(FluentIcons.new_folder),
              title: Text('Make a new folder'),
              isSelected: false,
            ),
            PaneItemWidget(
              icon: CustomIcons.add,
              title: Text('Add files to folder'),
              isSelected: false,
            ),
          ],
          footerItems: [
            PaneItemWidget(
              icon: Icon(FluentIcons.help),
              title: Text('Help'),
              isSelected: false,
            ),
            PaneItemWidget(
              icon: CustomIcons.settings,
              title: Text('Settings'),
              isSelected: true,
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
