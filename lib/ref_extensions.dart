import 'dart:developer';

import 'package:flutter_riverpod/misc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Ref を拡張して、AsyncProvider の値を一度だけ取得するユーティリティを作成
// 参考: https://zenn.dev/harx/articles/d8c49cdec0ab1d#%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3%EF%BC%92%EF%BC%9Aawait-ref.read(provider.future)%E3%81%AE%E5%AF%BE%E5%87%A6
extension ReadAsyncOnce on Ref {
  /// 対象 AsyncProvider の「今この瞬間の値」を一度だけ取得する。
  /// - 再計算は行わず、購読→取得→即クローズ
  /// - Riverpod 2.x の `await ref.read(provider.future)` 相当の用途
  Future<T> readAsyncOnce<T>(AsyncProviderListenable<T> provider) async {
    // futureプロバイダを一時購読
    final subscription = container.listen(provider.future, (_, _) {});
    try {
      // 既に完了していれば即時で、未完了なら完了まで待って取得
      return await subscription.read();
    } finally {
      subscription.close();
      log('購読を終了しました。');
    }
  }
}