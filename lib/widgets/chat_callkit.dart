import 'package:flutter/material.dart';

import '../inherited/chat_callkit_manager_impl.dart';

class ChatCallKitCallKit extends StatefulWidget {
  const ChatCallKitCallKit({
    required this.agoraAppId,
    required this.child,
    this.timeoutDuration = const Duration(seconds: 30),
    super.key,
  });
  final String agoraAppId;
  final Widget child;

  final Duration timeoutDuration;

  @override
  State<ChatCallKitCallKit> createState() => ChatCallKitCallKitState();

  static ChatCallKitCallKitState of(BuildContext context) {
    ChatCallKitCallKitState? state;
    state = context.findAncestorStateOfType<ChatCallKitCallKitState>();
    assert(
      state != null,
      'You must have a ChatCallKitCallKit widget at the top of you widget tree',
    );

    return state!;
  }
}

class ChatCallKitCallKitState extends State<ChatCallKitCallKit> {
  @override
  void initState() {
    ChatCallKitCallKitManagerImpl.instance.agoraAppId = widget.agoraAppId;
    ChatCallKitCallKitManagerImpl.instance.callTimeout = widget.timeoutDuration;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
