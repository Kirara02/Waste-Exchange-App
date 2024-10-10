import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/presentation/providers/websocket/webscocket_provider.dart';

class WsPage extends ConsumerWidget {
  const WsPage({super.key});

  void _sendMessage(WidgetRef ref, String message) {
    final webSocket = ref.read(webSocketProvider);
    webSocket.sink.add(message);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageStream = ref.watch(webSocketMessagesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('WebSocket Demo')),
      body: messageStream.when(
        data: (data) => Center(child: Text('Received: $data')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendMessage(ref, 'Hello WebSocket!');
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
