import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  Future<DummyNewsResponse> getTopStories() async {
    // ここで本当は HTTP 通信などをする
    await Future.delayed(const Duration(seconds: 3)); // 擬似的な遅延

    switch (testType) {
      case .success:
        return DummyNewsResponse(
          200, 
          DummyNews(1, '🍜 マジで美味いラーメン店がオープン！', 'やっぱり日曜の昼は、京都ラーメンでしょ。')
        );
      case .failure:
        return DummyNewsResponse(500, null);
      case .newsNotFound:
        return DummyNewsResponse(200, null);
    }
  }
}

@riverpod
NewsApi newsApi(Ref ref) {
  return const NewsApi();
}