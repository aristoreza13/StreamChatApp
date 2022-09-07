import 'package:chatstream/app.dart';
import 'package:chatstream/screens/screens.dart';
import 'package:chatstream/theme.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client = StreamChatClient(streamKey);
  runApp(
    MyApp(
      client: client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Flutter Chat Stream',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          // ignore: deprecated_member_use
          child: ChannelsBloc(child: UsersBloc(child: child!)),
        );
      },
      home: const SelectUserScreen(),
    );
  }
}
