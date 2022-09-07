import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const streamKey = 'p9d27wun5q3e';

var logger = log.Logger();

// Extensions
extension StreamChatContext on BuildContext {
  // Fetch current user
  User? get currentUser => StreamChatCore.of(this).currentUser;

  // Fetch current user image.
  String? get currentUserImage => currentUser!.image;
}
