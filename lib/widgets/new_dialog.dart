import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/backend/file_handler.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/text_field.dart';

class NewDialog extends StatefulWidget {
  @override
  State<NewDialog> createState() => _NewDialogState();
}

class _NewDialogState extends State<NewDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return ContentDialog(
        constraints: const BoxConstraints(maxHeight: 368, maxWidth: 368),
        title: const Text('Create a new secure folder'),
        content: Container(
          child: Column(
            children: [
              TextFieldWidget(title: 'Password', controller: _controller),
            ],
          ),
        ),
        actions: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 300),
            child: Center(
              child: Button(
                child: Text(
                  'Pick folder',
                  style: TextStyle(color: model.accentTextColor),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        ButtonState.resolveWith((states) => model.accentColor)),
                onPressed: () async {
                  if (_controller.text.isEmpty) {
                    print('Empty password');
                    return;
                  }
                  final res = await FileHandler.getNewFolderPath();
                  print(res);
                },
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 300),
            child: Center(
              child: Button(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
