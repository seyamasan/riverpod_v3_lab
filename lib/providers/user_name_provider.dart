import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_name_provider.g.dart';

@riverpod
Future<String> userName(Ref ref) async {
  // ここでAPI通信などをするイメージ
  await Future.delayed(const Duration(seconds: 5)); // 擬似的な遅延

  // こんな感じをイメージ
  // final api = ref.read(userApiProvider);
  // final name = await api.fetchUserName();
  // return name;

  return 'seyamasan'; // 仮のユーザー名
}