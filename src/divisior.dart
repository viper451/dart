import 'dart:io';

void main() {
  print('Enter N');
  var N = int.parse(stdin.readLineSync()!);
  printFactors(N);
}

void printFactors(int n) {
  print("The factors for $n are:");
  for (int i = 1; i < n; i++) {
    if (n % i == 0) {
      print(i);
    }
  }
}
