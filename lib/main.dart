import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'providers/scouting_data_provider.dart';
import 'pages/info_page.dart';
import 'pages/auto_page.dart';
import 'pages/teleop_page.dart';
import 'pages/comment_and_confirm_page.dart';
import 'pages/dev_result_page.dart';

void main() {
  // debugProfileBuildsEnabled = true; // 追蹤 Widget 建構
  // debugProfileBuildsEnabledUserWidgets = true; // 追蹤使用者 Widget 建構
  // debugProfileLayoutsEnabled = true; // 追蹤 RenderObject 佈局
  // debugProfilePaintsEnabled = true; // 追蹤 RenderObject 繪製
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(
      ChangeNotifierProvider(
          create: (context) => ScoutingData(), child: const ScoutingApp()),
    );
  });
}

class ScoutingApp extends StatelessWidget {
  const ScoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scouting App',
      home: const AppWrapper(child: InfoPage()), // 包裝 InfoPage
      routes: {
        '/info': (context) =>
            const AppWrapper(child: InfoPage()), // 路由 '/info' 對應到 InfoPage
        '/auto': (context) => const AppWrapper(child: AutoPage()),
        '/teleop': (context) => const AppWrapper(child: TeleopPage()),
        '/comment': (context) => const AppWrapper(child: CommentAndConfirmPage()),
        '/result': (context) => const AppWrapper(child: DevResultPage()),
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
        child, // 主要畫面內容
        const VersionBadge(), // 左下角版本號
      ],
    );
  }
}

// 取得版本號並顯示在左下角
class VersionBadge extends StatefulWidget {
  const VersionBadge({super.key});

  @override
  State<VersionBadge> createState() => _VersionBadgeState();
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
