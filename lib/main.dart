import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/home_view.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/news_paging_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppThemeProvider()),
          ChangeNotifierProvider(create: (context) => NewsPagingProvider()),
        ],
        child: const NewsApp(),
      ),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {AppRoutes.homeRouteName: (context) => HomeView()},
        initialRoute: AppRoutes.homeRouteName,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.appTheme,
      ),
    );
  }
}
