import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/presentation/misc/constants.dart';
import 'package:waste_exchange/presentation/misc/utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketProvider = Provider<WebSocketChannel>((ref) {
  final channel = WebSocketChannel.connect(
    Uri.parse(Constants.WSURL),
  );
  printIfDebug('WebSocket connected');
  ref.onDispose(() {
    channel.sink.close();
    printIfDebug('WebSocket disconnected');
  });
  return channel;
});

final webSocketMessagesProvider = StreamProvider<String>((ref) {
  final webSocket = ref.watch(webSocketProvider);
  return webSocket.stream.handleError((error) {
    printIfDebug('WebSocket Error: $error');
  }).map((message) => message.toString());
});
