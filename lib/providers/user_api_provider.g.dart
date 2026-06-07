// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userApi)
const userApiProvider = UserApiProvider._();

final class UserApiProvider
    extends $FunctionalProvider<UserApi, UserApi, UserApi>
    with $Provider<UserApi> {
  const UserApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userApiHash();

  @$internal
  @override
  $ProviderElement<UserApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserApi create(Ref ref) {
    return userApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserApi>(value),
    );
  }
}

String _$userApiHash() => r'b7d354dd2276d90a6d9f1867f2d322b8d607bcd1';
