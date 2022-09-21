class FetchError {
  const FetchError(
      {this.message = "Unable to fetch data.", required this.statusCode})
      : super();
  final String message;
  final int statusCode;
  @override
  String toString() => message;
}
