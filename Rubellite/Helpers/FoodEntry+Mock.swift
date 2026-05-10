//

import Foundation

extension FoodEntry {
  static var mock: FoodEntry {
    FoodEntry(
      name: "Куриная грудка",
      date: .now,
      grams: 150,
      calories: 247,
      protein: 46.5,
      fat: 5.4,
      carbs: 0
    )
  }
  
  static var mockArray: [FoodEntry] {
    [
      FoodEntry(name: "Овсянка", grams: 200, calories: 136, protein: 4.5, fat: 2.3, carbs: 24.5),
      FoodEntry(name: "Греческий йогурт", grams: 170, calories: 100, protein: 17.0, fat: 0.7, carbs: 6.0),
      FoodEntry(name: "Банан", grams: 120, calories: 105, protein: 1.3, fat: 0.4, carbs: 27.0),
      FoodEntry(name: "Авокадо", grams: 100, calories: 160, protein: 2.0, fat: 14.7, carbs: 8.5)
    ]
  }
}
