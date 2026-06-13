import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  void build() {}

  // 何かしらの変更を行うメソッド
  void toggleCreateNewsSheet() {
    log('toggleCreateNewsSheet called.');
  }
}