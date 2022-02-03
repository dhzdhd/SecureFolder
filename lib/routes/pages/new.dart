import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:secure_folder/widgets/folder_container.dart';
import 'package:secure_folder/widgets/icons.dart';
import 'package:secure_folder/widgets/new_dialog.dart';

class NewPage extends StatelessWidget {
  final list = [
    FolderContainerWidget(child: Text('e')),
    FolderContainerWidget(child: Text('e')),
    FolderContainerWidget(child: Text('e')),
    FolderContainerWidget(child: Text('e')),
    FolderContainerWidget(child: Text('e')),
    FolderContainerWidget(child: Text('e')),
    FolderContainerWidget(child: Text('e'))
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Make a new secure folder',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 20),
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
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}
