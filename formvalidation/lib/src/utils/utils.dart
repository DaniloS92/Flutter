bool isNumeric(String number) {
  if (number.isEmpty) return false;

  final res = num.tryParse(number);

  return (res == null) ? false : true;
}
