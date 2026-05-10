//
//  PreviewContainer.swift
//  Culet
//
//  Created by Eyhciurmrn Zmpodackrl on 26.04.2026.
//

import Foundation
import SwiftData

@MainActor
struct PreviewContainer {
  static let container: ModelContainer = {
    do {
      let schema = Schema(FoodEntry.self)
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: schema, configurations: config)
      
      let context = container.mainContext
   
      for entry in FoodEntry.mockArray {
        context.insert(entry)
      }
      
      return container
    } catch {
      fatalError("Не удалось создать ModelContainer: \(error)")
    }
  }()
  
  static let emptyContainer: ModelContainer = {
    do {
      let schema = Schema(FoodEntry.self)
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: schema, configurations: config)
      
      let context = container.mainContext

      return container
    } catch {
      fatalError("Не удалось создать ModelContainer: \(error)")
    }
  }()
  
  static let oneItemContainer: ModelContainer = {
    do {
      let schema = Schema(FoodEntry.self)
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: schema, configurations: config)
      
      let context = container.mainContext
      
      let sampleData = [FoodEntry.mock]
      
      for entry in sampleData {
        context.insert(entry)
      }
      
      return container
    } catch {
      fatalError("Не удалось создать ModelContainer: \(error)")
    }
  }()
}
