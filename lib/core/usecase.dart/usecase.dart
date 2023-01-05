import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?> call(Params params);
}

class NoParams {
  // TODO: implement props
}

class Params extends Equatable {
  final int number;
  Params({
    required this.number,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
