//

import Foundation

@Observable
final class TodayTabViewModel {
  var formViewModel: FoodEntryFormViewModel?
  
  func openCreationSheet() {
    formViewModel = FoodEntryFormViewModel(mode: .create)
  }
}
