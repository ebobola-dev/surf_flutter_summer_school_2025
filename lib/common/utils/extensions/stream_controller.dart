import 'dart:async';

/// Extension on StreamController to safely add events if not closed.
extension SafeAdd<T> on StreamController<T> {
  /// Adds event to the stream only if the controller is not closed.
  void safeAdd(T event) {
    if (!isClosed) {
      add(event);
    }
  }
}
