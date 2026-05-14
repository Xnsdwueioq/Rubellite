//

import SwiftUI

struct EntriesSectionListView: View {
  @Environment(DataManager.self) private var dataManager
  @Environment(ErrorHandler.self) private var errorHandler
  @State private var viewModel = EntriesListViewModel()
  
  var section: (date: Date, entries: [FoodEntry])
  
  var body: some View {
    // MARK: - Section
    Section(section.date.formatted(date: .numeric, time: .omitted)) {
      ForEach(section.entries) { entry in
        // MARK: Food Entry Row
        FoodEntryView(entry: entry)
        
        // MARK: - Swipe Actions
          .swipeActions(
            edge: .leading,
            allowsFullSwipe: true
          ) {
            Button("Редактировать", systemImage: "pencil") {
              viewModel.editFoodEntry(entry: entry)
            }
            .tint(.blue)
          }
          .swipeActions(
            edge: .trailing,
            allowsFullSwipe: true
          ) {
            Button("Удалить", systemImage: "trash", role: .destructive) {
              viewModel.deleteFoodEntry(
                entry: entry,
                dataManager: dataManager,
                errorHandler: errorHandler
              )
            }
          }
        
        // MARK: - Context Menu
          .contextMenu {
            Button("Редактировать", systemImage: "pencil") {
              viewModel.editFoodEntry(entry: entry)
            }
            Button("Удалить", systemImage: "trash", role: .destructive) {
              viewModel.deleteFoodEntry(
                entry: entry,
                dataManager: dataManager,
                errorHandler: errorHandler
              )
            }
          }
          .sheet(item: $viewModel.formViewModel) { viewModel in
            FoodEntryFormView(viewModel: viewModel)
          }
      }
    }
  }
}
