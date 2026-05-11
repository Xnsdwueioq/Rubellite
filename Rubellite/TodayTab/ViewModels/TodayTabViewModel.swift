//

import Foundation

@Observable
final class TodayTabViewModel {
  var isFoodEntryCreating: Bool = false
  
  var newFoodEntry = FoodEntryDraft()
  var nutritionCalculator = NutritionCalculator()
  
  init(
    isFoodEntryCreating: Bool = false,
    newFoodEntry: FoodEntryDraft = FoodEntryDraft(),
    nutritionCalculator: NutritionCalculator = NutritionCalculator()
  ) {
    self.isFoodEntryCreating = isFoodEntryCreating
    self.newFoodEntry = newFoodEntry
    self.nutritionCalculator = nutritionCalculator
  }
  
  func openCreationSheet() {
    isFoodEntryCreating = true
  }
  
  func createFoodEntry(dataManager: DataManager) throws {
    let foodEntry = try nutritionCalculator.fillInFoodEntry(draft: newFoodEntry)
    try dataManager.add(entry: foodEntry)
    isFoodEntryCreating = false
  }
}
