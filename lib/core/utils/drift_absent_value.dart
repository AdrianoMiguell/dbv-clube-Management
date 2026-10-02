import 'package:drift/drift.dart';

extension DriftAbsentValue<T> on T? {
  Value<T> toValue() {
    final value = this;
    if (value == null) return const Value.absent();
    return Value(value);
  }
}
