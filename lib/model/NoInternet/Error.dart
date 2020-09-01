class ErrorPage{
  String message;
  ErrorPage({this.message});

  @override
  String toString() {
    return 'ErrorPage{message: $message}';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ErrorPage && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}