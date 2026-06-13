import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_v3_lab/providers/news/top_stories_provider.dart';
import 'package:riverpod_v3_lab/providers/user/user_name_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key, required this.title});

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
