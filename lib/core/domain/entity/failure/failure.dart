base class Failure<T extends Object?> implements Exception {
  /// Сообщение ошибки.
  ///
  /// Должно иметь такое содержание, которое будет понятно при чтении логов.
  final String? message;

  /// Родительский [Exception], если имеется.
  ///
  /// Необходим для корректной фиксации логов.
  final Object? original;

  /// [StackTrace] родительской ошибки, если есть.
  final StackTrace? stackTrace;

  const Failure({this.message, this.original, this.stackTrace});

  @override
  String toString() {
    return message ?? 'Failure without message';
  }
}
