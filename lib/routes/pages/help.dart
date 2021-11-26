import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:secure_folder/widgets/expander.dart';

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
              ExpanderWidget(header: Text('Credits'), content: Container()),
              ExpanderWidget(
                header: Text('License'),
                content: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(File('LICENSE').readAsStringSync())),
              ),
              ExpanderWidget(
                header: Text('Changelog'),
                content: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(File('CHANGELOG.md').readAsStringSync())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
