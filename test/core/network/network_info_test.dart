import 'package:clean_architecture_course/core/network/network_info.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker =
      MockDataConnectionChecker();
  NetworkInfoImpl networkInfo = NetworkInfoImpl(mockDataConnectionChecker);

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should return true if the device is connected to the internet',
      () async {
        when(mockDataConnectionChecker.hasConnection as Function())
            .thenAnswer((_) => Future.value(true));

        verify(mockDataConnectionChecker.hasConnection as Function());

        final result = await networkInfo.isConnected;

        expect(result, true);
      },
    );
  });
}
