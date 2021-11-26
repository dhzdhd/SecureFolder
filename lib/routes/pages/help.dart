import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:secure_folder/widgets/expander.dart';
import 'package:secure_folder/widgets/icons.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Help & Credits',
          style: TextStyle(fontSize: 30),
        ),
      ),
      content: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          child: ListView(
            children: [
              ExpanderWidget(
                leading: CustomIcons.credits,
                header: Text('Credits'),
                content: Text(
                    'All credits go to dhzdhd - owner of the app.\nDiscord: dhzdhd#2244'),
              ),
              ExpanderWidget(
                leading: CustomIcons.license,
                header: Text('License'),
                content: Text(File('LICENSE').readAsStringSync()),
              ),
              ExpanderWidget(
                leading: CustomIcons.changelog,
                header: Text('Changelog'),
                content: Text(File('CHANGELOG.md').readAsStringSync()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
