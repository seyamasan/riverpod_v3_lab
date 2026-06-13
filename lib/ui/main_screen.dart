import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_v3_lab/providers/news/top_stories_provider.dart';
import 'package:riverpod_v3_lab/providers/user/user_name_provider.dart';
import 'package:riverpod_v3_lab/ui/view_models/main_view_model.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 普通に今まで通りの使い方で良さそう
    final viewModel = ref.read(mainViewModelProvider.notifier);

    final asyncUserName = ref.watch(userNameProvider);
    final userName = asyncUserName.value ?? 'Unknown';

    final asyncTopStories = ref.watch(topStoriesProvider);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // https://zenn.dev/harx/articles/d8c49cdec0ab1d#%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3%EF%BC%91%EF%BC%9Aviewmodel
          // これでも普通に呼び出せる
          // 再現できなかった
          // final viewModel = ref.read(mainViewModelProvider.notifier);
          // viewModel.toggleCreateNewsSheet();

          viewModel.toggleCreateNewsSheet();
        },
        label: const Text('作成'),
        icon: const Icon(Icons.create),
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
