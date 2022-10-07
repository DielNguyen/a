import 'package:a/core/styles/app_theme.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection_container.dart' as di;
import 'package:easy_localization/easy_localization.dart';

import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (_, child) => const MyApp(),
        )
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            title: 'Posts App',
            theme: appTheme,
            routes: AppRoutes.routes,
            initialRoute: R.loginPage,
        )
    );
  }

  static void setLocale(BuildContext context, Locale locale) {}
}