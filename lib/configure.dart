import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_di.dart' as di;
import 'core/utils/app_env.dart';

import 'my_app.dart';

Future<void> configure(Env env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
  
  AppEnv.setupEnv(env);
  await di.init();

  await ScreenUtil.ensureScreenSize();
  runApp(const CWalletApp());
}
