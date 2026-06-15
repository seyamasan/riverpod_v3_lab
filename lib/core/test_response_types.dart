enum TestUserResponseTypes {
  success,
  failure,
  userNotFound,
}

enum TestNewsResponseTypes {
  success,
  failure,
  newsNotFound,
}

class TestResponseTypes {
  // user api レスポンスのテスト用のフラグ
  static TestUserResponseTypes testUserResponseTypes = .success;

  // news api レスポンスのテスト用のフラグ
  static TestNewsResponseTypes testNewsResponseTypes = .success;
}