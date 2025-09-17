import 'dart:io';

void main() {
  print('=== Program Kalkulator BMI ===');

  List<Map<String, dynamic>> histori = [];

  while (true) {
    print('\nMenu:');
    print('1. Hitung BMI');
    print('2. Lihat Histori');
    print('3. Keluar');
    stdout.write('Pilih menu (1/2/3): ');
    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      double? tinggi = bacaInputDouble('Masukkan tinggi badan (cm): ');
      double? berat = bacaInputDouble('Masukkan berat badan (kg): ');

      if (validasiInput(tinggi, berat)) {
        print('Input valid. Silakan lanjut ke perhitungan BMI.');
        hitungBMI(tinggi!, berat!, histori);
      } else {
        print('Input tidak valid. Tinggi dan berat harus lebih dari 0 dan berupa angka.');
      }
    } else if (pilihan == '2') {
      tampilkanHistori(histori);
    } else if (pilihan == '3') {
      print('Terima kasih telah menggunakan program.');
      break;
    } else {
      print('Pilihan tidak valid. Silakan pilih 1, 2, atau 3.');
    }
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

void hitungBMI(double tinggiCm, double beratKg, List<Map<String, dynamic>> histori) {
  double tinggiM = tinggiCm / 100;
  double bmi = beratKg / (tinggiM * tinggiM);

  String kategori = (bmi < 18.5)
      ? "Kurus"
      : (bmi < 25)
          ? "Normal"
          : (bmi < 30)
              ? "Gemuk"
              : "Obesitas";

  print('BMI: ${bmi.toStringAsFixed(2)} ($kategori)');

  histori.add({
    'tinggi': tinggiCm,
    'berat': beratKg,
    'bmi': bmi,
    'kategori': kategori,
  });
}

void tampilkanHistori(List<Map<String, dynamic>> histori) {
  if (histori.isEmpty) {
    print('Belum ada histori perhitungan.');
  } else {
    print('\n=== Histori Perhitungan BMI ===');
    for (int i = 0; i < histori.length; i++) {
      var data = histori[i];
      print('${i + 1}. Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, '
          'BMI: ${data['bmi'].toStringAsFixed(2)}, Kategori: ${data['kategori']}');
    }
  }
}
