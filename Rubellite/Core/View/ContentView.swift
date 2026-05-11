//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Environment(ErrorHandler.self) private var errorHandler
  
  var body: some View {
    AppTabsView()
      .environment(DataManager(modelContext: modelContext))
      .alert(
        errorHandler.currentAlert?.title ?? "Ошибка",
        isPresented: Binding(
          get: { errorHandler.currentAlert != nil },
          set: { if !$0 { errorHandler.currentAlert = nil } }
        ),
        presenting: errorHandler.currentAlert,
        actions: { _ in
          Button("Ок", role: .confirm) { }
        },
        message: { alert in
          Text(alert.message)
        }
      )
  }
}

#Preview {
  ContentView()
    .withPreviewDependencies()
}
