//

import Foundation
import SwiftData
import os

@Observable
final class DataManager {
  var modelContext: ModelContext
  
  init(modelContext: ModelContext) {
    self.modelContext = modelContext
  }
  
  func add(entry: FoodEntry) throws {
    do {
      modelContext.insert(entry)
      try modelContext.save()
    } catch {
      Logger.database.error("Не удалось сохранить модель в базу данных.")
      throw AppError.saveFailed
    }
  }
  
  func save() throws {
    do {
      try modelContext.save()
    } catch {
      Logger.database.error("Не удалось сохранить данные.")
      throw AppError.saveFailed
    }
  }
  
  func delete(entry: FoodEntry) throws {
    do {
      modelContext.delete(entry)
      try modelContext.save()
    } catch {
      Logger.database.error("Не удалось удалить модель из базы данных.")
      throw AppError.deleteFailed
    }
  }
  
  func fetchEnteries(for date: Date) throws -> [FoodEntry] {
    do {
      let start = Calendar.current.startOfDay(for: date)
      let end = Calendar.current.date(byAdding: .day, value: 1, to: start)!
      let predicate = #Predicate<FoodEntry> {
        $0.date >= start && $0.date < end
      }
      return try modelContext.fetch(FetchDescriptor(predicate: predicate))
    } catch {
      Logger.database.error("Не удалось загрузить данные из базы данных.")
      throw AppError.fetchFailed
    }
  }
}
