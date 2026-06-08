import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v3_lab/some_specific_error.dart';

part 'news_api_provider.g.dart';

enum TestNewsResponseTypes {
  success,
  failure,
  newsNotFound,
}

class DummyNews {
  final int id;
  final String title;
  final String mainText;

  DummyNews(this.id, this.title, this.mainText);
}

class DummyNewsResponse {
  final int statusCode;
  final DummyNews? news;

  DummyNewsResponse(this.statusCode, this.news);
}

class NewsApi {
  const NewsApi();

  final TestNewsResponseTypes testType = .success; // テスト用のフラグ

  Future<DummyNewsResponse> fetchNews() async {
    // ここで本当は HTTP 通信などをする
    await Future.delayed(const Duration(seconds: 3)); // 擬似的な遅延

    switch (testType) {
      case .success:
        return DummyNewsResponse(
          200, 
          DummyNews(1, 'マジで美味いラーメン店がオープン！', 'やっぱり日曜の昼は、京都ラーメンでしょ。')
        );
      case .failure:
        return DummyNewsResponse(500, null);
      case .newsNotFound:
        return DummyNewsResponse(200, null);
    }
  }
}

// 個別の Provider に対してリトライの処理をカスタマイズすることもできる
Duration? newsApiRetry(int retryCount, Object error) {
  if (error is SomeSpecificError) return null;
  if (5 < retryCount) return null;

  return Duration(seconds: retryCount * 2);
}

@Riverpod(retry: newsApiRetry)
NewsApi newsApi(Ref ref) {
  return const NewsApi();
}