import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingsRawListProvider = StateProvider<List<String>>((ref) {
  return [];
});
