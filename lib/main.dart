import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_v3_lab/providers/news/top_stories_provider.dart';
import 'package:riverpod_v3_lab/providers/user/user_name_provider.dart';
import 'package:riverpod_v3_lab/some_specific_error.dart';

void main() {
  runApp(
    ProviderScope(
      // リトライの処理をカスタマイズすることもできる
      // 全ての Provider に対して適用される
      // この例では、SomeSpecificError の場合はリトライしないようにしている
      // また、リトライの回数が 5 回を超えた場合もリトライしないようにしている
      // リトライの間隔を再実行ごとに増やしている
      retry: (retryCount, error) {
        if (error is SomeSpecificError) return null;
        if (5 < retryCount) return null;

        return Duration(seconds: retryCount * 2);
      },
      // リトライを無効化
      // providerに対して個別にリトライを指定している場合は、そちらが優先される
      // retry: (_, _) => null,
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod V3 Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Riverpod V3 Demo Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserName = ref.watch(userNameProvider);
    final userName = asyncUserName.value ?? 'Unknown';

    final asyncTopStories = ref.watch(topStoriesProvider);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center( 
          child: Column(
            mainAxisAlignment: .center,
            children: [
              // ユーザー名セクション
              const Text('ユーザー名:'),
              Text(
                userName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),

              // ニュースセクション
              Expanded(
                child: asyncTopStories.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, st) => const Center(
                    child: Text('ニュースの取得に失敗しました'),
                  ),
                  data: (topStories) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '⭐️ 人気のニュース',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      // ニュースタイトル
                      Text(
                        topStories.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      // 本文
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            topStories.mainText,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
