import 'package:fluent_ui/fluent_ui.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Add to existing folder',
          style: TextStyle(fontSize: 30),
        ),
      ),
      content: Container(),
    );
  }
}
