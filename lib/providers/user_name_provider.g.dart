// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_name_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userName)
const userNameProvider = UserNameProvider._();

final class UserNameProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const UserNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userNameHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return userName(ref);
  }
}

String _$userNameHash() => r'29d8f6f15a106e854ed201d8571bbeeddc0c96b2';
