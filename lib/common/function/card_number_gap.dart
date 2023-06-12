class CardData {
  String cardNumber;

  CardData({required this.cardNumber});
}

String separateNumber(String number) {
  final sections = <String>[];

  for (int i = 0; i < number.length; i += 4) {
    sections.add(number.substring(i, i + 4));
  }

  return sections.join(' ');
}

String hideAndSeparateNumber(String number) {
  final hiddenDigits =
      number.substring(0, number.length - 4).replaceAll(RegExp(r'\d'), '*');
  final lastFourDigits = number.substring(number.length - 4);

  final sections = <String>[];
  for (int i = 0; i < hiddenDigits.length; i += 4) {
    sections.add(hiddenDigits.substring(i, i + 4));
  }

  return '${sections.join(' ')} $lastFourDigits';
}
