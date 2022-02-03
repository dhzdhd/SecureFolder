import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart' hide ThemeData;
import 'package:fluent_ui/fluent_ui.dart'
    hide Acrylic, AcrylicHelper, AcrylicProperties, AnimatedAcrylic;
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:secure_folder/routes/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Window.initialize();

  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(1280, 720);
    win.minSize = Size(1300, 0);
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = 'Secure Folder';
    win.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(builder: (context, model, child) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          title: 'SecureFolder',
          theme: model.theme,
          initialRoute: '/',
          routes: {'/': (context) => HomeRoute()},
        );
      }),
    );
  }
}
