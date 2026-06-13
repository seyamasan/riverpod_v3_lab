// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_news_enabled_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isCreateNewsEnabled)
const isCreateNewsEnabledProvider = IsCreateNewsEnabledProvider._();

final class IsCreateNewsEnabledProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const IsCreateNewsEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isCreateNewsEnabledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isCreateNewsEnabledHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return isCreateNewsEnabled(ref);
  }
}

String _$isCreateNewsEnabledHash() =>
    r'e445851011cc5c23287f5e1a285cf4c711996c6b';
