class FetchError {
  const FetchError({this.message = "Unable to fetch data."}) : super();
  final String message;
  @override
  String toString() => message;
}
