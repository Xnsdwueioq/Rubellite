//

import Foundation

@Observable
final class FoodEntryFormViewModel: Identifiable {
  enum Mode {
    case create
    case edit(FoodEntry)
  }
  
  let id = UUID()
  
  var mode: Mode = .create
  var foodEntryDraft: FoodEntryDraft
  var isFoodEntryDraftValid: Bool { foodEntryDraft.isValid }
  
  var nutritionCalculator = NutritionCalculator()
  
  var navigationTitle: String {
    switch mode {
    case .create:
      "Создание записи"
    case .edit:
      "Редактирование записи"
    }
  }
  
  var saveButtonSysemImage: String {
    switch mode {
    case .create:
      "plus"
    case .edit:
      "checkmark"
    }
  }
  
  init(
    mode: Mode = .create,
    nutritionCalculator: NutritionCalculator = NutritionCalculator()
  ) {
    self.mode = mode
    switch mode {
    case .create:
      self.foodEntryDraft = FoodEntryDraft()
    case .edit(let foodEntry):
      self.foodEntryDraft = FoodEntryDraft(from: foodEntry)
    }
    self.nutritionCalculator = nutritionCalculator
  }
  
  func save(dataManager: DataManager) throws {
    guard isFoodEntryDraftValid else { throw AppError.nonValidEntryForm }
    switch mode {
    case .create:
      let entry = try nutritionCalculator.fillInFoodEntry(draft: foodEntryDraft)
      try dataManager.add(entry: entry)
      
    case .edit(let entry):
      let nutrition = try nutritionCalculator.calculateNutrition(from: foodEntryDraft)
      entry.name     = nutrition.name
      entry.date     = nutrition.date
      entry.grams    = nutrition.grams
      entry.calories = nutrition.calories
      entry.protein  = nutrition.protein
      entry.fat      = nutrition.fat
      entry.carbs    = nutrition.carbs
      try dataManager.save()
    }
  }
}
