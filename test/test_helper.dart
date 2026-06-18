import 'package:flutter/widgets.dart';
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

// Riverpod 3.x系以降のウィジェットテスト用のヘルパー関数
ProviderScope createScope({
  required Widget child,
  List<Override> overrides = const [],
  List<ProviderObserver> observers = const [],
}) {
  return ProviderScope(
    retry: (retryCount, error) => null, // <<<<< ここの設定が必要！！
    overrides: overrides,
    observers: observers,
    child: child,
  );
}
