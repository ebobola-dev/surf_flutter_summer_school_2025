import 'package:flutter/foundation.dart';

/// Extension for ValueNotifier to emit only if value changed.
/// Supports deep comparison for List, Set, and Map.
extension EmitExtension<T> on ValueNotifier<T> {
  /// Updates value only if it's different from the current one.
  ///
  /// Supports deep comparison for List, Set, and Map.
  void emit(T newValue) {
    final current = value;
    if (_areEqual(current, newValue)) return;
    value = newValue;
  }

  /// Compares two values deeply if they are collections.
  bool _areEqual(Object? a, Object? b) {
    if (a is List && b is List) {
      return listEquals(a, b);
    } else if (a is Set && b is Set) {
      return setEquals(a, b);
    } else if (a is Map && b is Map) {
      return mapEquals(a, b);
    } else {
      return a == b;
    }
  }
}
