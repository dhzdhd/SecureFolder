import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileHandler {
  static Future<String?> getNewFolderPath() async {
    return await FilePicker.platform.getDirectoryPath();
  }

  static String getBatScript(String filename, String password) {
    return '''cls
@ECHO OFF
title Folder ${filename}
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST ${filename} goto MDLOCKER
:CONFIRM
echo Are you sure u want to Lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
Advertisement
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM

:LOCK
ren ${filename} "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto End
:UNLOCK
echo Enter password to Unlock folder
set/p "pass=>"
if NOT %pass%==${password} goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" ${filename}
echo Folder Unlocked successfully
goto End
:FAIL
echo Invalid password
goto end
:MDLOCKER
md ${filename}
echo ${filename} created successfully
goto End
:End''';
  }

  static Future<void> createBatFile(
      String path, String filename, String password) async {
    final batScript = FileHandler.getBatScript(filename, password);
    final file = await File('$path\\$filename.bat').create();
    file.writeAsString(batScript);
  }
}
