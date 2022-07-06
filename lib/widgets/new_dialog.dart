import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/text_field.dart';

class NewDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return ContentDialog(
        title: const Text('Create a new secure folder'),
        content: Container(
          child: Column(
            children: [
              TextFieldWidget(title: 'Name'),
              TextFieldWidget(title: 'Password'),
            ],
          ),
        ),
        actions: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 300),
            child: Center(
              child: Button(
                child: Text(
                  'Create',
                  style: TextStyle(color: model.accentTextColor),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        ButtonState.resolveWith((states) => model.accentColor)),
                onPressed: () {
                  Navigator.of(context).pop();
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
