//

import Foundation
import SwiftData

@Observable
final class DataManager {
  var modelContext: ModelContext
  
  init(modelContext: ModelContext) {
    self.modelContext = modelContext
  }
  
  func add(entry: FoodEntry) throws {
    modelContext.insert(entry)
    try modelContext.save()
  }
  
  func delete(entry: FoodEntry) throws {
    modelContext.delete(entry)
    try modelContext.save()
  }
  
  func fetchEnteries(for date: Date) throws -> [FoodEntry] {
    let start = Calendar.current.startOfDay(for: date)
    let end = Calendar.current.date(byAdding: .day, value: 1, to: start)!
    let predicate = #Predicate<FoodEntry> {
      $0.date >= start && $0.date < end
    }
    
    return try modelContext.fetch(FetchDescriptor(predicate: predicate))
  }
}
