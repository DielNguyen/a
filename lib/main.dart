import 'package:a/core/app_theme.dart';
import 'package:a/features/post/presentation/blocs/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_bloc.dart';
import 'package:a/features/post/presentation/blocs/posts/posts_event.dart';
import 'package:a/features/post/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
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
            title: 'Posts App',
            theme: appTheme,
            home: PostsPage()
        )
    );
  }

  static void setLocale(BuildContext context, Locale locale) {}
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  final Logger _logger = Logger();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) _logger.i(change);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    _logger.i(transition);
  }
}
