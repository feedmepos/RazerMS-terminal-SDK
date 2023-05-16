class TransportHeaderDecode {
  List<String> codes;

  TransportHeaderDecode({
    required this.codes,
  });

  List<String> get transportHeader => codes.sublist(3, 13);
}