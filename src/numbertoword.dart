import 'package:number_to_words/number_to_words.dart';
import 'dart:io';

void main() {
  print('Enter N');
  var N = int.parse(stdin.readLineSync()!);

  print(NumberToWord().convert('en-in', N)); //thousand
  // print(NumberToWord().convert('en-in', 100)); //hundred
  // print(NumberToWord().convert('en-in', 10)); //ten
}
