import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v3_lab/providers/news/news_api_provider.dart';
import 'package:riverpod_v3_lab/some_specific_error.dart';

part 'top_stories_provider.g.dart';

// 個別の Provider に対してリトライの処理をカスタマイズすることもできる
Duration? newsApiRetry(int retryCount, Object error) {
  if (error is SomeSpecificError) return null;
  if (3 < retryCount) return null;

  return Duration(seconds: retryCount * 2);
}

@Riverpod(retry: newsApiRetry)
Future<DummyNews> topStories(Ref ref) async {
  final api = ref.read(newsApiProvider);
  final response = await api.getTopStories();

  log('topStories() API実行済み: time: ${DateTime.now()}, statusCode=${response.statusCode}');
  if (response.statusCode != 200) {
    throw Exception('ユーザーの情報の取得に失敗しました。');
  }

  if (response.news == null) {
    throw SomeSpecificError('ニュースが存在しません。');
  }

  return response.news!;
}