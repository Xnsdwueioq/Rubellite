//

import SwiftUI
import SwiftData

struct EntriesListView: View {
  @State private var viewModel = EntriesListViewModel()
  
  @Query(sort: \FoodEntry.date) var entries: [FoodEntry]
  
  var sections: [(date: Date, entries: [FoodEntry])] {
    let dict = Dictionary(grouping: entries, by: { Calendar.current.startOfDay(for: $0.date) })
      .map { (date: $0.key, entries: $0.value) }
      .sorted { $0.date > $1.date }
    
    return dict
  }
  
  var body: some View {
    if !sections.isEmpty {
      List(sections, id: \.date) { section in
        EntriesSectionListView(section: section)
      }
    } else {
      ContentUnavailableView("Список записей пуст", systemImage: "tray.fill", description: Text("Добавьте свою первую запись чтобы увидеть список"))
    }
  }
}

#Preview {
  EntriesListView()
    .withPreviewDependencies()
}
