//

import os

final class NutritionCalculator {
  func calculateNutrition(from draft: FoodEntryDraft) throws -> Nutrition {
    // MARK: - No Package
    if !draft.isPackageMode {
      if let grams = Double(draft.grams),
         let calories = Double(draft.calories),
         let protein = Double(draft.protein),
         let fat = Double(draft.fat),
         let carbs = Double(draft.carbs) {
        let nutrition: Nutrition = (name: draft.name, date: draft.date, grams: grams, calories: calories, protein: protein, fat: fat, carbs: carbs)
        return nutrition
      } else {
        Logger.services.error("Не удалось рассчитать состав. Некоторые данные введены некорректно.")
        throw AppError.nutritionCalculeFailed
      }
      
    // MARK: - Package Mode
    } else {
      if let portionGrams = Double(draft.portionGrams),
         let packageGrams = Double(draft.packageGrams),
         let packageCalories = Double(draft.packageCalories),
         let packageProtein = Double(draft.packageProtein),
         let packageFat = Double(draft.packageFat),
         let packageCarbs = Double(draft.packageCarbs) {
        let scale = portionGrams / packageGrams
        let calories = scale * packageCalories
        let protein = scale * packageProtein
        let fat = scale * packageFat
        let carbs = scale * packageCarbs
        
        let nutrition: Nutrition = (name: draft.name, date: draft.date, grams: portionGrams, calories: calories, protein: protein, fat: fat, carbs: carbs)
        return nutrition
      } else {
        Logger.services.error("Не удалось рассчитать состав по упаковке. Некоторые данные введены некорректно.")
        throw AppError.nutritionCalculeFailed
      }
    }
  }
  
  func fillInFoodEntry(draft: FoodEntryDraft) throws -> FoodEntry {
    do {
      let nutrition = try calculateNutrition(from: draft)
      
      let newEntry = FoodEntry(
        name: nutrition.name,
        date: nutrition.date,
        grams: nutrition.grams,
        calories: nutrition.calories,
        protein: nutrition.protein,
        fat: nutrition.fat,
        carbs: nutrition.carbs
      )
      
      return newEntry
    } catch {
      Logger.services.error("Не удалось создать новую запись, так как не был рассчитан состав.")
      throw error
    }
  }
}
