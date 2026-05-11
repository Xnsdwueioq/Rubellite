//

import Foundation

struct FoodEntryDraft {
  var name: String = ""
  var date: Date = .now
  var grams: String = ""
  var calories: String = ""
  var protein: String = ""
  var fat: String = ""
  var carbs: String = ""
  
  // Для режима "C упаковки"
  var isPackageMode: Bool = false
  
  var portionGrams: String = ""
  var packageGrams: String = ""
  var packageCalories: String = ""
  var packageProtein: String = ""
  var packageFat: String = ""
  var packageCarbs: String = ""
  
  init() { }
  
  init(from entry: FoodEntry) {
    self.name = entry.name
    self.date = entry.date
    self.grams = entry.grams.formatted()
    self.calories = entry.calories.formatted()
    self.protein = entry.protein.formatted()
    self.fat = entry.fat.formatted()
    self.carbs = entry.carbs.formatted()
  }
}
