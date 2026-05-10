//

import SwiftUI

struct TodayTabView: View {
  @State private var viewModel = TodayTabViewModel()
  
  var body: some View {
    VStack {
      Button("Добавить", systemImage: "fork.knife") {
        viewModel.openCreationSheet()
      }
      .buttonStyle(.glassProminent)
    }
    .sheet(isPresented: $viewModel.isFoodEntryCreating) {
      CreationFoodEntryView(viewModel: viewModel)
    }
  }
}
