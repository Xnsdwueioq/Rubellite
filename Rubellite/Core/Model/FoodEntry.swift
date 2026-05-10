//

import Foundation
import SwiftData

@Model
final class FoodEntry {
  var name: String
  var date: Date
  var grams: Double
  var calories: Double
  var protein: Double
  var fat: Double
  var carbs: Double
  
  init(
    name: String,
    date: Date = .now,
    grams: Double = 0,
    calories: Double = 0,
    protein: Double = 0,
    fat: Double = 0,
    carbs: Double = 0
  ) {
    self.name = name
    self.date = date
    self.grams = grams
    self.calories = calories
    self.protein = protein
    self.fat = fat
    self.carbs = carbs
  }
}
