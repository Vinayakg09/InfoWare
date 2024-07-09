part of 'my_bloc_bloc.dart';

@immutable
sealed class MyBlocState {}

final class MyBlocInitial extends MyBlocState {}

final class Loading extends MyBlocState {}

final class Success extends MyBlocState {
  final List<dynamic> data;

  Success(this.data);
}

final class Failure extends MyBlocState {
  final String Error;
  Failure(this.Error);
}
