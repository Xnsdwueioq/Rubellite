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
  
  func createFoodEntry(dataManager: DataManager) {
    guard let foodEntry = nutritionCalculator.fillInFoodEntry(draft: newFoodEntry) else {
      return
    }
    do {
      try dataManager.add(entry: foodEntry)
    } catch {
      print(error.localizedDescription)
    }
    isFoodEntryCreating = false
  }
}
