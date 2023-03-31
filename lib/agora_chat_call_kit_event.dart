import 'package:agora_chat_callkit/agora_chat_callkit.dart';

class AgoraChatCallKitEventHandler {
  AgoraChatCallKitEventHandler({
    this.onError,
    this.onCallEnd,
    this.onReceiveCall,
    this.onJoinedChannel,
    this.onUserLeaved,
    this.onUserJoined,
    this.onFirstRemoteVideoDecoded,
  });
  final void Function(AgoraChatCallError error)? onError;

  final void Function(String callId, AgoraChatCallEndReason reason)? onCallEnd;

  final void Function(String userId, int agoraUid)? onUserLeaved;

  final void Function(String userId, int agoraUid, int width, int height)?
      onFirstRemoteVideoDecoded;

  final void Function(String userId, int agoraUid)? onUserJoined;

  final void Function(String channel)? onJoinedChannel;

  final void Function(String userId, String callId, AgoraChatCallType callType,
      Map<String, String>? ext)? onReceiveCall;
}
