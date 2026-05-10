//

import SwiftUI
import SwiftData

struct PreviewDependenciesModifier: ViewModifier {
  @State private var modelContainer = PreviewContainer.container
  @State private var router = AppRouter()
  
  func body(content: Content) -> some View {
    content
      .modelContainer(modelContainer)
      .environment(router)
      .environment(DataManager(modelContext: modelContainer.mainContext))
  }
}

extension View {
  func withPreviewDependencies() -> some View {
    self.modifier(PreviewDependenciesModifier())
  }
}
