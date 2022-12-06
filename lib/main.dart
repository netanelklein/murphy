import 'package:flutter/material.dart';
import 'style/color_schemes.dart';
import 'widgets/navigation/root_navigation.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'screens/messages/messages.dart';
import 'screens/profile/profile.dart';
import 'screens/settings/settings.dart';
import 'screens/authentication/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => AppState(),
      builder: (context, child) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          drawerTheme: lightDrawerTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          drawerTheme: darkDrawerTheme),
      themeMode: ThemeMode.dark,
      home: const RootNavigation(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => const RootNavigation(),
        '/messages': (BuildContext context) => const Messages(),
        '/profile': (BuildContext context) => const Profile(),
        '/settings': (BuildContext context) => const Settings(),
        '/login': (BuildContext context) => const Login(),
        // '/register': (BuildContext context) => const Register(),
      },
    );
  }
}
