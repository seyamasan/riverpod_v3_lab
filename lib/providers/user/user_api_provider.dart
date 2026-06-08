import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_api_provider.g.dart';

enum TestResponseTypes {
  success,
  failure,
  userNotFound,
}

class DummyUser {
  final int id;
  final String name;

  DummyUser(this.id, this.name);
}

class DummyUserResponse {
  final int statusCode;
  final DummyUser? user;

  DummyUserResponse(this.statusCode, this.user);
}

class UserApi {
  const UserApi();

  final TestResponseTypes testType = .success; // テスト用のフラグ

  Future<DummyUserResponse> fetchUser() async {
    // ここで本当は HTTP 通信などをする
    await Future.delayed(const Duration(seconds: 3)); // 擬似的な遅延

    switch (testType) {
      case .success:
        return DummyUserResponse(200, DummyUser(1, 'seyamasan'));
      case .failure:
        return DummyUserResponse(500, null); 
      case .userNotFound:
        return DummyUserResponse(200, null);
    }
  }
}

@riverpod
UserApi userApi(Ref ref) {
  return const UserApi();
}