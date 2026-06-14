import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_lab_service_provider.g.dart';

class StreamLabService {
  StreamLabService(this.ref);

  final Ref ref;

  // 同期の進捗を通知するStream
  final _onCompleted = StreamController<bool>.broadcast();

  // 同期完了時に発火するStream
  Stream<bool> get onCompleted => _onCompleted.stream;

  Future<void> fetch() async {

    log('StreamLabService: fetch started.');

    // 完了を通知
    _onCompleted.add(true);
  }
}

@Riverpod(keepAlive: true)
StreamLabService streamLabService(Ref ref) {
  final service = StreamLabService(ref);
  return service;
}

// 常にtrueを流すStreamProvider
// 同じ値が流れてくると通知されないため、継続的に通知を受け取れない
@riverpod
Stream<void> onSlsCompleted(Ref ref) {
  final service = ref.read(streamLabServiceProvider);
  return service.onCompleted;
}

// 常にtrueを流すStreamProvider
// イベントが来たら常に通知される
@Riverpod(name: 'onSlsCompletedNotifier')
class OnSlsCompletedNotifier extends _$OnSlsCompletedNotifier {
  @override
  Stream<bool> build() {
    final service = ref.read(streamLabServiceProvider);
    return service.onCompleted;
  }

  @override
  bool updateShouldNotify(
    AsyncValue<bool> previous,
    AsyncValue<bool> next,
  ) {
    // エラーやローディング中は通知しない
    if (next.hasError || next.isLoading) return false;

    // 常にtrueを流す
    // イベントが来たら常に通知する
    return true;
  }
}