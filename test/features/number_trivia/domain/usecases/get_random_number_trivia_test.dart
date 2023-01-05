import 'package:clean_architecture_course/Features/number_trivia/domain/entities/number_trivial.dart';
import 'package:clean_architecture_course/Features/number_trivia/domain/repositories/number_trivial_repository.dart';
import 'package:clean_architecture_course/Features/number_trivia/domain/usecases/get_random_number_trivial.dart';
import 'package:clean_architecture_course/core/usecase.dart/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetRandomNumberTrivia usecase;
  late int tNumber;
  late NumberTrivia tNumberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
    tNumberTrivia = NumberTrivia(number: 1, text: 'test');
    tNumber = 1;
  });

  test(
    'shoud get trivia from the repository',
    () async {
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase(NoParams());

      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
