import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  TextFieldWidget({required this.title, required this.controller});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextBox(
          controller: widget.controller,
          placeholder: this.widget.title,
          cursorColor: model.textColor,
          style: TextStyle(
            color: model.textColor,
            decorationColor: Colors.white,
          ),
        ),
      );
    });
  }
}
