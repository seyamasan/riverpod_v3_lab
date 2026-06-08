// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topStories)
const topStoriesProvider = TopStoriesProvider._();

final class TopStoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<DummyNews>,
          DummyNews,
          FutureOr<DummyNews>
        >
    with $FutureModifier<DummyNews>, $FutureProvider<DummyNews> {
  const TopStoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: newsApiRetry,
        name: r'topStoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topStoriesHash();

  @$internal
  @override
  $FutureProviderElement<DummyNews> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DummyNews> create(Ref ref) {
    return topStories(ref);
  }
}

String _$topStoriesHash() => r'fbedba3649c9165b02d780b65017bda3182030db';
