String formatRupiah(int value) {
  String formatted = value.toString();

  // Menambah pemisah titik setiap 3 digit dari belakang
  String result = '';
  int count = 0;

  for (int i = formatted.length - 1; i >= 0; i--) {
    if (count > 0 && count % 3 == 0) {
      result = '.$result';
    }
    result = '${formatted[i]}$result';
    count++;
  }

  return 'Rp $result';
}
