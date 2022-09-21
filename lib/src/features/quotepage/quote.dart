class Quote {
  const Quote(
      {required this.anime, required this.character, required this.quoteText});
  final String anime;
  final String quoteText;
  final String character;

  factory Quote.fromJSON(Map<String, Object?> json) => Quote(
      anime: json["anime"] as String,
      character: json["character"] as String,
      quoteText: json["quote"] as String);

  @override
  String toString() => """

Quote:

$quoteText

    - $anime

""";
}
