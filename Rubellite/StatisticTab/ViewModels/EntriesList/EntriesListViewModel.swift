//

import Foundation

@Observable
final class EntriesListViewModel {
  var formViewModel: FoodEntryFormViewModel?
  
  func deleteFoodEntry(entry: FoodEntry, dataManager: DataManager, errorHandler: ErrorHandler) {
    do {
      try dataManager.delete(entry: entry)
    } catch {
      errorHandler.handle(error)
    }
  }
  
  func editFoodEntry(entry: FoodEntry) {
    formViewModel = FoodEntryFormViewModel(mode: .edit( entry))
  }
}
