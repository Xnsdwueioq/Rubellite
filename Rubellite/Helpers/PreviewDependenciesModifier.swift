//

import SwiftUI
import SwiftData

struct PreviewDependenciesModifier: ViewModifier {
  @State private var modelContainer = PreviewContainer.container
  @State private var router = AppRouter()
  @State private var errorHandler = ErrorHandler()
  
  func body(content: Content) -> some View {
    content
      .modelContainer(modelContainer)
      .environment(router)
      .environment(DataManager(modelContext: modelContainer.mainContext))
      .environment(errorHandler)
  }
}

extension View {
  func withPreviewDependencies() -> some View {
    self.modifier(PreviewDependenciesModifier())
  }
}
