import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

class ExpanderWidget extends StatelessWidget {
  final Widget? leading;
  final Widget header;
  final Widget content;

  ExpanderWidget({required this.header, required this.content, this.leading});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (_, model, __) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Expander(
          leading: leading,
          header: header,
          content: content,
          headerBackgroundColor: ButtonState.all(model.secondaryColor),
          contentBackgroundColor: model.secondaryColor,
          headerHeight: 70,
        ),
      );
    });
  }
}
