import 'package:fluent_ui/fluent_ui.dart';

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
      content: Container(
        child: Column(
          children: [Expander(header: Text('Credits'), content: Container())],
        ),
      ),
    );
  }
}
