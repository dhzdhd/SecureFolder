import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return TextBox(
        placeholder: 'Password',
        cursorColor: model.textColor,
        style: TextStyle(color: model.textColor),
      );
    });
  }
}
