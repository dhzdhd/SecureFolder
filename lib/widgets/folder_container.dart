import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/icons.dart';

class FolderContainerWidget extends StatefulWidget {
  final Widget child;
  final Widget? icon;

  FolderContainerWidget({required this.child, this.icon});

  @override
  State<FolderContainerWidget> createState() => _FolderContainerWidgetState();
}

class _FolderContainerWidgetState extends State<FolderContainerWidget> {
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (_, model, __) {
      return Padding(
        padding: EdgeInsets.only(left: 0, right: 0),
        child: GestureDetector(
          onTapUp: (_) => {
            setState(() => {pressed = false})
          },
          onTapDown: (_) => {
            setState(() => {pressed = true})
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: pressed
                  ? model.secondaryColor.withAlpha(15)
                  : model.secondaryColor,
            ),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: widget.icon ?? CustomIcons.folder,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: widget.child,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
