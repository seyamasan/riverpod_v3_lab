import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_v3_lab/some_specific_error.dart';
import 'package:riverpod_v3_lab/ui/main_screen.dart';

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
      home: const MainScreen(title: 'Riverpod V3 Demo Page'),
    );
  }
}