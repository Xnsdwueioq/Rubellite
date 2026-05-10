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
  }
}

extension View {
  func withPreviewDependencies() -> some View {
    self.modifier(PreviewDependenciesModifier())
  }
}
