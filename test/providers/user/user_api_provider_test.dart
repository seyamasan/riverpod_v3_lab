import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_v3_lab/providers/user/user_api_provider.dart';

import '../../test_helper.dart';

void main() {
  group('UserApi.fetchUser', () {
    test('success: ステータスコード200 & ユーザーが取得できる', () async {
      // Given
      final container = createContainer(
        overrides: [
          // Provider を success 用に差し替え
          userApiProvider.overrideWith(
            (ref) => const UserApi(
              testResponseType: .success,
            ),
          ),
        ],
      );
      final api = container.read(userApiProvider);

      // When
      final response = await api.fetchUser();

      // Then
      expect(response.statusCode, 200);
      expect(response.user, isNotNull);
      expect(response.user!.id, 1);
      expect(response.user!.name, 'seyamasan');
    });

    test('failure: ステータスコード500 & user は null', () async {
      // Given
      final container = createContainer(
        overrides: [
          userApiProvider.overrideWith(
            (ref) => const UserApi(
              testResponseType: .failure,
            ),
          ),
        ],
      );
      final api = container.read(userApiProvider);

      // When
      final response = await api.fetchUser();

      // Then
      expect(response.statusCode, 500);
      expect(response.user, isNull);
    });

    test('userNotFound: ステータスコード200 だが user は null', () async {
      // Given
      final container = createContainer(
        overrides: [
          userApiProvider.overrideWith(
            (ref) => const UserApi(
              testResponseType: .userNotFound,
            ),
          ),
        ],
      );
      final api = container.read(userApiProvider);

      // When
      final response = await api.fetchUser();

      // Then
      expect(response.statusCode, 200);
      expect(response.user, isNull);
    });
  });
}