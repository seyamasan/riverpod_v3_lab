// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_lab_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(streamLabService)
const streamLabServiceProvider = StreamLabServiceProvider._();

final class StreamLabServiceProvider
    extends
        $FunctionalProvider<
          StreamLabService,
          StreamLabService,
          StreamLabService
        >
    with $Provider<StreamLabService> {
  const StreamLabServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'streamLabServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$streamLabServiceHash();

  @$internal
  @override
  $ProviderElement<StreamLabService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StreamLabService create(Ref ref) {
    return streamLabService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StreamLabService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StreamLabService>(value),
    );
  }
}

String _$streamLabServiceHash() => r'8f39dc6003314356f4754a705d7c9155c861b0f8';

@ProviderFor(onSlsCompleted)
const onSlsCompletedProvider = OnSlsCompletedProvider._();

final class OnSlsCompletedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, Stream<void>>
    with $FutureModifier<void>, $StreamProvider<void> {
  const OnSlsCompletedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onSlsCompletedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onSlsCompletedHash();

  @$internal
  @override
  $StreamProviderElement<void> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<void> create(Ref ref) {
    return onSlsCompleted(ref);
  }
}

String _$onSlsCompletedHash() => r'5fae971698c41b0e4461a093f6bf7cb06b717eea';

@ProviderFor(OnSlsCompletedNotifier)
const onSlsCompletedNotifier = OnSlsCompletedNotifierProvider._();

final class OnSlsCompletedNotifierProvider
    extends $StreamNotifierProvider<OnSlsCompletedNotifier, bool> {
  const OnSlsCompletedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onSlsCompletedNotifier',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onSlsCompletedNotifierHash();

  @$internal
  @override
  OnSlsCompletedNotifier create() => OnSlsCompletedNotifier();
}

String _$onSlsCompletedNotifierHash() =>
    r'494e3f6f9f6f57295391a270475799f93848dd0a';

abstract class _$OnSlsCompletedNotifier extends $StreamNotifier<bool> {
  Stream<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
