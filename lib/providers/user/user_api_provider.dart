import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v3_lab/test_response_types.dart';

part 'user_api_provider.g.dart';

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

  Future<DummyUserResponse> fetchUser() async {
    // ここで本当は HTTP 通信などをする
    await Future.delayed(const Duration(seconds: 3)); // 擬似的な遅延

    switch (TestResponseTypes.testUserResponseTypes) {
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