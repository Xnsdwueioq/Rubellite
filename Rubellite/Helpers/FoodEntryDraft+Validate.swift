//

import Foundation

extension FoodEntryDraft {
  // MARK: - Per-field
  var isNameValid: Bool     { !name.trimmed.isEmpty }
  var isGramsValid: Bool    { Double(grams) != nil }
  var isCaloriesValid: Bool { Double(calories) != nil }
  var isProteinValid: Bool  { Double(protein) != nil }
  var isFatValid: Bool      { Double(fat) != nil }
  var isCarbsValid: Bool    { Double(carbs) != nil }
  
  var isPortionGramsValid:    Bool { Double(portionGrams) != nil }
  var isPackageGramsValid:    Bool { Double(packageGrams) != nil }
  var isPackageCaloriesValid: Bool { Double(packageCalories) != nil }
  var isPackageProteinValid:  Bool { Double(packageProtein) != nil }
  var isPackageFatValid:      Bool { Double(packageFat) != nil }
  var isPackageCarbsValid:    Bool { Double(packageCarbs) != nil }
  
  // MARK: - All Properties Validation
  var isValid: Bool {
    guard isNameValid else { return false }
    if isPackageMode {
      return isPortionGramsValid && isPackageGramsValid &&
      isPackageCaloriesValid && isPackageProteinValid &&
      isPackageFatValid && isPackageCarbsValid
    } else {
      return isGramsValid && isCaloriesValid &&
      isProteinValid && isFatValid && isCarbsValid
    }
  }
}

extension String {
  var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}
