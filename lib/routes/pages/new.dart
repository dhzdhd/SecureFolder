import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/folder_container.dart';
import 'package:secure_folder/widgets/icons.dart';
import 'package:secure_folder/widgets/new_dialog.dart';

class NewPage extends StatelessWidget {
  final list = [
    'e',
    'e',
    'e',
    'e',
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Make a new secure folder',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 100,
              height: 40,
              child: Consumer<ThemeModel>(builder: (context, model, child) {
                return Button(
                  child: CustomIcons.add,
                  onPressed: () => showDialog(
                      context: context, builder: (context) => NewDialog()),
                  style: ButtonStyle(
                    backgroundColor: ButtonState.all(model.secondaryColor),
                    elevation: ButtonState.all(1),
                  ),
                );
              }),
            ),
          )
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return FolderContainerWidget(child: Text(list[index]));
          },
        ),
      ),
    );
  }
}
