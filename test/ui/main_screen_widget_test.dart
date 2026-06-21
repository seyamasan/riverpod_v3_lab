import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_v3_lab/providers/news/news_api_provider.dart';
import 'package:riverpod_v3_lab/providers/news/top_stories_provider.dart';
import 'package:riverpod_v3_lab/providers/user/user_name_provider.dart';
import 'package:riverpod_v3_lab/ui/main_screen.dart';
import 'package:riverpod_v3_lab/ui/states/main_state.dart';
import 'package:riverpod_v3_lab/ui/view_models/main_view_model.dart';

import '../test_helper.dart';

// ダミーのViewModel
class DummyMainViewModel extends MainViewModel {
  int toggleCalledCount = 0;

  @override
  MainState build() {
    return MainState();
  }

  @override
  Future<void> toggleCreateNewsSheet() async {
    toggleCalledCount++;
  }
}

void main() {
  group('MainScreen Widget Test', () {
    testWidgets(
      '画面を開いたとき、ユーザー名とニュースが正しく表示される',
      (tester) async {
        // Given
        final dummyViewModel = DummyMainViewModel();
        final dummyNews = DummyNews(
          1,
          '🍜 マジで美味いラーメン店がオープン！',
          'やっぱり日曜の昼は、京都ラーメンでしょ。',
        );

        await tester.pumpWidget(
          createScope(
            overrides: [
              // ViewModel をダミー実装に差し替え
              mainViewModelProvider.overrideWith(() => dummyViewModel),

              // ユーザー名を固定で返す
              userNameProvider.overrideWithValue(
                const AsyncValue.data('seyamasan'),
              ),

              // トップニュースを固定で返す
              topStoriesProvider.overrideWithValue(
                AsyncValue.data(dummyNews),
              ),
            ],
            child: const MaterialApp(
              home: MainScreen(title: 'Riverpod V3 Demo Page'),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Then
        // ユーザー名が表示されている
        expect(find.text('ユーザー名:'), findsOneWidget);
        expect(find.text('seyamasan'), findsOneWidget);

        // ニュースが表示されている
        expect(
          find.text('⭐️ 人気のニュース'),
          findsOneWidget,
        );
        expect(
          find.text('🍜 マジで美味いラーメン店がオープン！'),
          findsOneWidget,
        );
        expect(
          find.text('やっぱり日曜の昼は、京都ラーメンでしょ。'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'ニュース取得エラー時はエラーメッセージが表示される',
      (tester) async {
        // Given
        await tester.pumpWidget(
          createScope(
            overrides: [
              userNameProvider.overrideWithValue(
                const AsyncValue.data('seyamasan'),
              ),
              topStoriesProvider.overrideWithValue(
                AsyncValue.error(
                  Exception('Network error'),
                  StackTrace.empty,
                ),
              ),
            ],
            child: const MaterialApp(
              home: MainScreen(title: 'ホーム'),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Then
        expect(find.text('ニュースの取得に失敗しました'), findsOneWidget);
      },
    );

    testWidgets(
      'ニュース読み込み中はインジケーターが表示される',
      (tester) async {
        // Given
        await tester.pumpWidget(
          createScope(
            overrides: [
              userNameProvider.overrideWithValue(
                const AsyncValue.data('seyamasan'),
              ),
              topStoriesProvider.overrideWithValue(
                const AsyncValue.loading(),
              ),
            ],
            child: const MaterialApp(
              home: MainScreen(title: 'ホーム'),
            ),
          ),
        );

        await tester.pump();

        // Then
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'FABタップすると ViewModel.toggleCreateNewsSheet が1回呼ばれる',
      (tester) async {
        // Given
        final dummyViewModel = DummyMainViewModel();

        await tester.pumpWidget(
          createScope(
            overrides: [
              mainViewModelProvider.overrideWith(() => dummyViewModel),
            ],
            child: const MaterialApp(
              home: MainScreen(title: 'Riverpod V3 Demo Page'),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // When
        // FAB をタップ
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        // Then
        // ダミー ViewModel のメソッド呼び出し回数で検証
        expect(dummyViewModel.toggleCalledCount, 1);
      },
    );
  });
}