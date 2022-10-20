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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote;
  }

  @override
  int get hashCode => anime.hashCode ^ quoteText.hashCode ^ character.hashCode;
}
