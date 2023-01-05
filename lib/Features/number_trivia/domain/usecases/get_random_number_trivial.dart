import 'package:clean_architecture_course/core/error/failures.dart';
import 'package:clean_architecture_course/core/usecase.dart/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/number_trivial.dart';
import '../repositories/number_trivial_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
