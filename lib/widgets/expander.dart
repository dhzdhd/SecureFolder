import 'package:fluent_ui/fluent_ui.dart';

class ExpanderWidget extends StatelessWidget {
  final Widget? leading;
  final Widget header;
  final Widget content;

  ExpanderWidget({required this.header, required this.content, this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Expander(
        leading: leading,
        header: header,
        content: content,
        headerHeight: 70,
      ),
    );
  }
}
