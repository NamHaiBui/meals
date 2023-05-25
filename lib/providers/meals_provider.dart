import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// We can use listens to this provider of which "provides" us with the information in widgets
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
