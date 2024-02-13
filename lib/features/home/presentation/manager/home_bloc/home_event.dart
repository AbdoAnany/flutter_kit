part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class CountChanged extends HomeEvent {
  final int count;

  CountChanged({required this.count});
}


class LoginSubmitted extends HomeEvent {
  LoginSubmitted();
}
