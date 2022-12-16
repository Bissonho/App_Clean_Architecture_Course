import 'package:equatable/equatable.dart';

class NumberTrivial extends Equatable {
  final String text;
  final int number;

  NumberTrivial({
    required this.text,
    required this.number,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [text, number];
}
