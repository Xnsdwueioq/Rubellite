//

import SwiftUI

struct StatisticTabView: View {
  var body: some View {
    List {
      NavigationLink(destination: {
        EntriesListView()
          .navigationTitle("Список записей")
      }) {
        Label("Список записей", systemImage: "book.pages.fill")
      }
    }
  }
}

#Preview {
  NavigationStack {
    StatisticTabView()
      .withPreviewDependencies()
  }
}
