import 'package:fluent_ui/fluent_ui.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Make a new secure folder',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Button(
                child: Icon(FluentIcons.new_folder),
                onPressed: () => print(''),
                style: ButtonStyle(
                    backgroundColor:
                        ButtonState.all(Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
          )
        ],
      ),
      content: Container(),
    );
  }
}
