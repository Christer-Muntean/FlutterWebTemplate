import 'package:ahoyme/data/auth/auth_notifier.dart';
import 'package:ahoyme/pages/admin/admin_page.dart';
import 'package:ahoyme/pages/home/home_page.dart';
import 'package:ahoyme/pages/hoy/hoy_page.dart';
import 'package:ahoyme/pages/message/message_page.dart';
import 'package:ahoyme/pages/unknown/unknown_page.dart';
import 'package:ahoyme/route/no_animation_material_page_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ],
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Web Template',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          onGenerateRoute: (settings) {
            // Handle '/'
            if (settings.name == HomePage.route) {
              return NoAnimationMaterialPageRoute(builder: (context) => HomePage(), settings: settings);
            }

            if (settings.name == MessagePage.route) {
              return NoAnimationMaterialPageRoute(builder: (context) => MessagePage(), settings: settings);
            }

            if (settings.name == HoyPage.route) {
              return NoAnimationMaterialPageRoute(builder: (context) => HoyPage(), settings: settings);
            }

            if (settings.name == AdminPage.route) {
              return NoAnimationMaterialPageRoute(builder: (context) => AdminPage(), settings: settings);
            }

            // Handle '/details/:id'
            /*var uri = Uri.parse(settings.name);
              if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'details') {
                var id = uri.pathSegments[1];
                return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
              }*/

            return MaterialPageRoute(builder: (context) => UnknownPage(), settings: settings);
          },
          routes: {
            HomePage.route: (context) => HomePage(),
            MessagePage.route: (context) => MessagePage(),
            HoyPage.route: (context) => HoyPage(),
            AdminPage.route: (context) => AdminPage(),
          },
          initialRoute: HomePage.route,
        );
      },
    );
  }
}
