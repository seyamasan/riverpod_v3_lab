import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_news_enabled_provider.g.dart';

@riverpod
Future<bool> isCreateNewsEnabled(Ref ref) async {
  // 例えばリモート設定やローカル DB から取ってくる想定
  await Future<void>.delayed(const Duration(seconds: 1));
  return true;
}