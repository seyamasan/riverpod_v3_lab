import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Riverpod 3.x系以降のユニットテスト用のヘルパー関数
ProviderContainer createContainer({
  List<Override> overrides = const [],
  List<ProviderObserver> observers = const [],
}) {
  return ProviderContainer.test(
    overrides: overrides,
    observers: observers,
    retry: (retryCount, error) => null, // リトライしない
  );
}