class Quote {
  const Quote({required this.anime, required this.quoteText});
  final String anime;
  final String quoteText;

  factory Quote.fromJSON(Map<String, Object?> json) =>
      Quote(anime: json["anime"] as String, quoteText: json["quote"] as String);

  @override
  String toString() => """

Quote:

$quoteText

    - $anime

""";
}
