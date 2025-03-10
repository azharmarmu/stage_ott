import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_router.dart';
import 'core/utils/app_strings.dart';

class CWalletApp extends StatefulWidget {
  const CWalletApp({super.key});

  @override
  State<CWalletApp> createState() => _CWalletAppState();
}

class _CWalletAppState extends State<CWalletApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        builder: (_, child) {
          return child!;
        },
        initialRoute: AppRoutes.ottLanding,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
