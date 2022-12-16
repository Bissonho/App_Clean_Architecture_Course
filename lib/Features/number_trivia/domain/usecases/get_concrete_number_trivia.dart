// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_course/Features/number_trivia/domain/entities/number_trivial.dart';
import 'package:clean_architecture_course/Features/number_trivia/domain/repositories/number_trivial_repository.dart';
import 'package:clean_architecture_course/core/error/failures.dart';
import 'package:clean_architecture_course/core/error/usecase.dart/usecase.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTrivialRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}
