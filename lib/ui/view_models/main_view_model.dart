import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v3_lab/providers/news/create_news_enabled_provider.dart';
import 'package:riverpod_v3_lab/ref_extensions.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  void build() {}

  Future<void> toggleCreateNewsSheet() async {
    // viewModelのインスタンスがwatchされていれば例外は発生しない
    // final isEnabled = await ref.read(isCreateNewsEnabledProvider.future);

    // 購読
    // final subscription = ref.listen(isCreateNewsEnabledProvider.future, (p, n){});

    // try {
    //   final isEnabled = await subscription.read();

    //   if (isEnabled) {
    //     log('ニュースの作成が許可されている。');
    //   } else {
    //     log('ニュースの作成が許可されていない。');
    //   }
    // } finally {
    //   subscription.close();
    //   log('購読を終了しました。');
    // }

    // 拡張しているので、これで購読から値の取得、購読の終了までできる
    final isEnabled = await ref.readAsyncOnce(isCreateNewsEnabledProvider);

    if (isEnabled) {
      log('ニュースの作成が許可されている。');
    } else {
      log('ニュースの作成が許可されていない。');
    }
  }
}