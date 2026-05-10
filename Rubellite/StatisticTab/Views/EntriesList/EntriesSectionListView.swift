//

import SwiftUI

struct EntriesSectionListView: View {
  var section: (date: Date, entries: [FoodEntry])
  
  var body: some View {
    Section(section.date.formatted(date: .numeric, time: .omitted)) {
      ForEach(section.entries) { entry in
        FoodEntryView(entry: entry)
      }
    }
  }
}
