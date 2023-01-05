import 'package:clean_architecture_course/Features/number_trivia/domain/entities/number_trivial.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia();
}
