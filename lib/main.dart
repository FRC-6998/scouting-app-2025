import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'providers/scouting_data_provider.dart';
import 'pages/auto_page.dart';
import 'pages/telop_page.dart';
import 'pages/result_page.dart';

void main() {
  debugProfileBuildsEnabled = true; // 追蹤 Widget 建構
  debugProfileBuildsEnabledUserWidgets = true; // 追蹤使用者 Widget 建構
  debugProfileLayoutsEnabled = true; // 追蹤 RenderObject 佈局
  debugProfilePaintsEnabled = true; // 追蹤 RenderObject 繪製
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
          create: (context) => ScoutingDataProvider(),
          child: const ScoutingApp()
      ),
    );
  });
}

class ScoutingApp extends StatelessWidget {
  const ScoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scouting App',
      home: const AppWrapper(child: AutoPage()),  // 包裝 AutoPage
      routes: {
        '/auto': (context) => const AppWrapper(child: AutoPage()),
        '/teleop': (context) => const AppWrapper(child: TelopPage()),
        '/result': (context) => const AppWrapper(child: ResultPage()),
      },
    );
  }
}

// 包裝每個頁面的 Widget，加入版本號
class AppWrapper extends StatelessWidget {
  final Widget child;
  const AppWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       child,  // 主要畫面內容
    //       const VersionBadge(),  // 左下角版本號
    //     ],
    //   ),
    // );
    return Stack(
            children: [
              child,  // 主要畫面內容
              const VersionBadge(),  // 左下角版本號
            ],
          );
  }
}

// class VersionBadge extends StatelessWidget {
//   const VersionBadge({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const String version = String.fromEnvironment("APP_VERSION", defaultValue: "1.0.0");
//     const String buildNumber = String.fromEnvironment("BUILD_NUMBER", defaultValue: "1");
//
//     return Positioned(
//       left: 10,
//       bottom: 10,
//       child: Text(
//         "v$version+$buildNumber",
//         style: const TextStyle(fontSize: 12, color: Colors.grey),
//       ),
//     );
//   }
// }

// 取得版本號並顯示在左下角
class VersionBadge extends StatefulWidget {
  const VersionBadge({super.key});

  @override
  _VersionBadgeState createState() => _VersionBadgeState();
}

class _VersionBadgeState extends State<VersionBadge> {
  String _version = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = "v${packageInfo.version}+${packageInfo.buildNumber}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 10,
      child: Text(
        _version,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
