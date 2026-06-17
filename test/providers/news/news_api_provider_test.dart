import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_v3_lab/providers/news/news_api_provider.dart';

import '../../test_helper.dart';

void main() {
  group('NewsApi.getTopStories', () {
    test('success: ステータス200 & ニュースが取得できる', () async {
      // Given
      final container = createContainer(
        overrides: [
          newsApiProvider.overrideWith(
            (ref) => const NewsApi(
              testResponseType: .success,
            ),
          ),
        ],
      );
      final api = container.read(newsApiProvider);

      // When
      final response = await api.getTopStories();

      // Then
      expect(response.statusCode, 200);
      expect(response.news, isNotNull);
      expect(response.news!.id, 1);
      expect(response.news!.title, '🍜 マジで美味いラーメン店がオープン！');
      expect(
        response.news!.mainText,
        'やっぱり日曜の昼は、京都ラーメンでしょ。',
      );
    });

    test('failure: ステータス500 & news は null', () async {
      // Given
      final container = createContainer(
        overrides: [
          newsApiProvider.overrideWith(
            (ref) => const NewsApi(
              testResponseType: .failure,
            ),
          ),
        ],
      );
      final api = container.read(newsApiProvider);

      // When
      final response = await api.getTopStories();

      // Then
      expect(response.statusCode, 500);
      expect(response.news, isNull);
    });

    test('newsNotFound: ステータス200 だが news は null', () async {
      // Given
      final container = createContainer(
        overrides: [
          newsApiProvider.overrideWith(
            (ref) => const NewsApi(
              testResponseType: .newsNotFound,
            ),
          ),
        ],
      );
      final api = container.read(newsApiProvider);

      // When
      final response = await api.getTopStories();

      // Then
      expect(response.statusCode, 200);
      expect(response.news, isNull);
    });
  });
}