import 'dart:math';

extension ListExtension<T> on List<T> {
  T? pickRandomly() {
    if (isEmpty) return null;
    final random = Random(DateTime.now().millisecondsSinceEpoch);
    final num = random.nextInt(length);
    return this[num];
  }
}
