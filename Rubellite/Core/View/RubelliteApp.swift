//

import SwiftUI
import SwiftData

@main
struct RubelliteApp: App {
  @State private var router = AppRouter()
  @State private var errorHandler = ErrorHandler()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: FoodEntry.self)
        .environment(router)
        .environment(errorHandler)
    }
  }
}
