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
  
  // Для режима "с упаковки"
  var isPackageMode: Bool = false
  
  var portionGrams: String = ""
  var packageGrams: String = ""
  var packageCalories: String = ""
  var packageProtein: String = ""
  var packageFat: String = ""
  var packageCarbs: String = ""
}
