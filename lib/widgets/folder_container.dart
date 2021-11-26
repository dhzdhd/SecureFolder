import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/icons.dart';

class FolderContainerWidget extends StatelessWidget {
  final Widget child;
  final Widget? icon;

  FolderContainerWidget({required this.child, this.icon});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (_, model, __) {
      return Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: model.secondaryColor,
            ),
            child: Center(
              child: Column(
                children: [
                  Flexible(
                    flex: 5,
                    child: SizedBox(
                        width: 100, child: icon ?? CustomIcons.addScaled),
                  ),
                  Flexible(
                    flex: 1,
                    child: child,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
