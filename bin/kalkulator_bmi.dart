import 'dart:io';

void main() {
  print('Program Kalkulator BMI');

  double? tinggi = bacaInputDouble('Masukkan tinggi badan (cm): ');
  double? berat = bacaInputDouble('Masukkan berat badan (kg): ');

  if (validasiInput(tinggi, berat)) {
    print('Input valid. Silakan lanjut ke perhitungan BMI.');
  } else {
    print('Input tidak valid. Tinggi dan berat harus lebih dari 0.');
  }
}

double? bacaInputDouble(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync();
  return double.tryParse(input ?? '');
}

bool validasiInput(double? tinggi, double? berat) {
  if (tinggi == null || berat == null) return false;
  if (tinggi <= 0 || berat <= 0) return false;
  return true;
}
