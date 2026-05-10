//

import SwiftUI

struct FoodEntryView: View {
  var entry: FoodEntry
  
  var body: some View {
    VStack {
      HStack {
        Text(entry.name)
        Spacer()
      }
      HStack(spacing: 5) {
        Text(entry.grams.formatted() + " г")
        Text("•")
        Text(entry.calories.formatted() + " ккал")
        Text("•")
        Text("БЖУ:")
        Text(entry.protein.formatted())
        Text("•")
        Text(entry.fat.formatted())
        Text("•")
        Text(entry.carbs.formatted())
        Spacer()
      }
      .foregroundStyle(.secondary)
    }
  }
}
