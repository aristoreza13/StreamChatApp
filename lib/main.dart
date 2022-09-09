import 'package:chatstream/app.dart';
import 'package:chatstream/screens/screens.dart';
import 'package:chatstream/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'firebase_options.dart';

void main() async {
  final client = StreamChatClient(streamKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(
      client: client,
      appTheme: AppTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
    required this.appTheme,
  }) : super(key: key);

  final StreamChatClient client;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      title: 'Flutter Chat Stream',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          // ignore: deprecated_member_use
          child: ChannelsBloc(child: UsersBloc(child: child!)),
        );
      },
      home: const SplashScreen(),
    );
  }
}
