import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// This is for more static date, ex: A List that never chagnes
// final favouriteMealsProvider = Provider((ref) => null);
//For more complex data that changes with certain cases
final favouriteMealsProvider =
    StateNotifierProvider<FavoriteNotifier, List<Meal>>((ref) {
  return FavoriteNotifier();
});

// The naming convention for the class is %Notifier
class FavoriteNotifier extends StateNotifier<List<Meal>> {
  // Initial data goes into the super following the data type defined by the generics above
  FavoriteNotifier() : super([]);

  bool toggleMealsFavoriteStatus(Meal meal) {
    /**You are not allowed to edit an existing value in memory 
     * Instead, you have to create a new one
     */
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      // note that where, map returns a new list
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // we respread itself and add the new instance
      state = [...state, meal];
      return true;
    }
  }
}
