import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

class TextFieldWidget extends StatefulWidget {
  final title;

  TextFieldWidget({required this.title});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TextBox(
          controller: textController,
          placeholder: this.widget.title,
          cursorColor: model.textColor,
          style:
              TextStyle(color: model.textColor, decorationColor: Colors.white),
        ),
      );
    });
  }
}
