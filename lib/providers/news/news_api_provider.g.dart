// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(newsApi)
const newsApiProvider = NewsApiProvider._();

final class NewsApiProvider
    extends $FunctionalProvider<NewsApi, NewsApi, NewsApi>
    with $Provider<NewsApi> {
  const NewsApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsApiHash();

  @$internal
  @override
  $ProviderElement<NewsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewsApi create(Ref ref) {
    return newsApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewsApi>(value),
    );
  }
}

String _$newsApiHash() => r'e18a7840e5cda889ba2ac62bf4746ef6062fd9e2';
