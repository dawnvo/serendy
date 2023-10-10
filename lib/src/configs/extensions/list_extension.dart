import 'dart:math';

extension ListExtension<T> on List<T> {
  T? pickRandomly() {
    if (isEmpty) return null;
    final random = Random.secure().nextInt(length);
    return this[random];
  }
}
