//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    let dataManager = DataManager(modelContext: modelContext)
    
    AppTabsView()
      .environment(dataManager)
  }
}

#Preview {
  ContentView()
}
