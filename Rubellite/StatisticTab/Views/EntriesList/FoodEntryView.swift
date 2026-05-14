//

import SwiftUI

struct FoodEntryView: View {
  var entry: FoodEntry
  
  var body: some View {
    VStack {
      // MARK: - Name
      HStack {
        Text(entry.name)
        Spacer()
      }
      
      // MARK: - Nutrition
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
