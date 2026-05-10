//

import Foundation

@Observable
final class TodayTabViewModel {
  var isFoodEntryCreating: Bool = false
  
  var newFoodEntry = FoodEntryDraft()
  
  func openCreationSheet() {
    isFoodEntryCreating = true
  }
}
