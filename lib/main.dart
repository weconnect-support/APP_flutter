import "package:flutter/material.dart";
import "package:webviewflutter/screens/webview.dart";
import "package:webviewflutter/service/versioncheck.dart";
import "package:package_info_plus/package_info_plus.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final serverVersion = await fetchServerAppVersion();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String localVersion = packageInfo.version;
  // pubspec.yaml 파일에서 로컬 앱 버전

  // 로컬 버전과 서버 버전을 비교
  if (localVersion == serverVersion) {
    debugPrint("same version");
    runApp(const MyApp());
  } else {
    // 버전이 다르면 일단 로그 띄우기.
    debugPrint(serverVersion);
    debugPrint("update plz..");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: WebViewPage(),
    );
  }
}
