import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/new_dialog.dart';

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
              width: 100,
              height: 40,
              child: Consumer<ThemeModel>(builder: (context, model, child) {
                return Button(
                  child: Icon(
                    FluentIcons.new_folder,
                    color: model.accentTextColor,
                  ),
                  onPressed: () => showDialog(
                      context: context, builder: (context) => NewDialog()),
                  style: ButtonStyle(
                    backgroundColor: ButtonState.all(model.accentColor),
                    elevation: ButtonState.all(1),
                  ),
                );
              }),
            ),
          )
        ],
      ),
      content: Container(),
    );
  }
}
