import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v3_lab/providers/user_api_provider.dart';

part 'user_name_provider.g.dart';

@riverpod
Future<String> userName(Ref ref) async {
  final api = ref.read(userApiProvider);
  final response = await api.fetchUser();

  log('API実行済み: time: ${DateTime.now()}, statusCode=${response.statusCode}');

  if (response.statusCode != 200) {
    throw Exception('ユーザーの情報の取得に失敗しました。');
  }

  if (response.user == null) {
    throw Exception('ユーザーの情報が存在しません。');
  }

  return response.user!.name;
}