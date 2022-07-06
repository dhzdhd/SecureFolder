import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/expander.dart';
import 'package:secure_folder/widgets/icons.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Help & Credits',
          style: TextStyle(fontSize: 30),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          child: ListView(
            children: [
              ExpanderWidget(
                leading: CustomIcons.credits,
                header: const Text('Credits'),
                content: const Text(
                    'All credits go to dhzdhd - owner of the app.\nDiscord: dhzdhd#2244'),
              ),
              ExpanderWidget(
                leading: CustomIcons.license,
                header: const Text('License'),
                content: Text(File('LICENSE').readAsStringSync()),
              ),
              ExpanderWidget(
                leading: CustomIcons.changelog,
                header: const Text('Changelog'),
                content: Consumer<ThemeModel>(builder: (_, model, __) {
                  return MarkdownBody(
                    data: File('CHANGELOG.md').readAsStringSync(),
                    styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
                    styleSheet: MarkdownStyleSheet(
                      h1: TextStyle(color: model.textColor),
                      h2: TextStyle(color: model.textColor),
                      h3: TextStyle(color: model.textColor),
                      h4: TextStyle(color: model.textColor),
                      h5: TextStyle(color: model.textColor),
                      h6: TextStyle(color: model.textColor),
                      p: TextStyle(color: model.textColor),
                      listBullet: TextStyle(color: model.textColor),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
