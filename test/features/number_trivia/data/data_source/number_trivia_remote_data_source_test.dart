import 'dart:convert';

import 'package:clean_architecture_course/Features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_course/Features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_course/core/error/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

import 'package:clean_architecture_course/core/network/http_client.dart';

class MockHttpClient extends Mock implements HttpClient {}

class FakeUri extends Fake implements Uri {}

void main() {
  MockHttpClient mockHttpClient = MockHttpClient();
  NumberTriviaRemoteDataSourceImpl dataSource =
      NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;

    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
      () {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer(
          (_) async => Response(fixture('trivia.json'), 200),
        );
        // act
        dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        verify(
          () => mockHttpClient.get(
            Uri.parse('http://numbersapi.com/$tNumber'),
            headers: {'Content-Type': 'application/json'},
          ),
        );
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer(
          (_) async => Response('Something went wrong', 404),
        );
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
      () {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer(
          (_) async => Response(fixture('trivia.json'), 200),
        );
        // act
        dataSource.getRandomNumberTrivia();
        // assert
        verify(
          () => mockHttpClient.get(
            Uri.parse('http://numbersapi.com/random'),
            headers: {'Content-Type': 'application/json'},
          ),
        );
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer(
          (_) async => Response(fixture('trivia.json'), 200),
        );
        // act
        final result = await dataSource.getRandomNumberTrivia();
        // assert
        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'should return NumberTrivia when the response code is 400 (success)',
      () async {
        //arrange
        when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer(
          (_) async => Response("'Something went wrong', 404", 400),
        );
        // assert
        expect(() => dataSource.getRandomNumberTrivia(),
            throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
