import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState{
  factory MainState({
    @Default(false) bool canEditName,
    @Default(null) String? userName
  }) = _MainState;
}