import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

// General failures
class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
