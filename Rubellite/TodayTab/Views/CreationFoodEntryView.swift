//

import SwiftUI

enum Field: Hashable {
  case name
  case grams, calories, protein, fat, carbs
  case portionGrams, packageGrams, packageCalories, packageProtein, packageFat, packageCarbs
}

struct CreationFoodEntryView: View {
  @Environment(DataManager.self) private var dataManager
  @Environment(ErrorHandler.self) private var errorHandler
  @Bindable var viewModel: TodayTabViewModel
  @FocusState private var focused: Field?
  
  var body: some View {
    NavigationStack {
      List {
        Section("Детали") {
          TextField("Название", text: $viewModel.newFoodEntry.name)
            .keyboardType(.asciiCapable)
            .focused($focused, equals: .name)
            .onSubmit {
              focused = .grams
            }
          DatePicker("Дата", selection: $viewModel.newFoodEntry.date)
        }
        Section("Состав") {
          Toggle("С упаковки", systemImage: "list.dash.header.rectangle", isOn: $viewModel.newFoodEntry.isPackageMode.animation(.snappy))
          if !viewModel.newFoodEntry.isPackageMode {
            TextField("Граммы", text: $viewModel.newFoodEntry.grams)
              .focused($focused, equals: .grams)
            TextField("Каллории", text: $viewModel.newFoodEntry.calories)
              .focused($focused, equals: .calories)
            TextField("Белки", text: $viewModel.newFoodEntry.protein)
              .focused($focused, equals: .protein)
            TextField("Жиры", text: $viewModel.newFoodEntry.fat)
              .focused($focused, equals: .fat)
            TextField("Углеводы", text: $viewModel.newFoodEntry.carbs)
              .focused($focused, equals: .carbs)
              .submitLabel(.done)
          } else {
            TextField("Граммы порции", text: $viewModel.newFoodEntry.portionGrams)
              .focused($focused, equals: .portionGrams)
            TextField("Граммы с упаковки", text: $viewModel.newFoodEntry.packageGrams)
              .focused($focused, equals: .packageGrams)
            TextField("Каллории с упаковки", text: $viewModel.newFoodEntry.packageCalories)
              .focused($focused, equals: .packageCalories)
            TextField("Белки с упаковки", text: $viewModel.newFoodEntry.packageProtein)
              .focused($focused, equals: .packageProtein)
            TextField("Жиры с упаковки", text: $viewModel.newFoodEntry.packageFat)
              .focused($focused, equals: .packageFat)
            TextField("Углеводы с упаковки", text: $viewModel.newFoodEntry.packageCarbs)
              .focused($focused, equals: .packageCarbs)
              .submitLabel(.done)
          }
        }
        .keyboardType(.numbersAndPunctuation)
      }
      .navigationTitle("Новая запись")
      .navigationBarTitleDisplayMode(.inline)
      // MARK: - Field Focus Settings
      .onAppear { focused = .name }
      .onSubmit {
        guard let focused else { return }
        let isPackage = viewModel.newFoodEntry.isPackageMode
        
        let next: Field? = switch focused {
        case .name:           isPackage ? .packageGrams     : .grams
        case .grams:          .calories
        case .calories:       .protein
        case .protein:        .fat
        case .fat:            .carbs
        case .carbs:          nil
        case .portionGrams:   .packageGrams
        case .packageGrams:   .packageCalories
        case .packageCalories:.packageProtein
        case .packageProtein: .packageFat
        case .packageFat:     .packageCarbs
        case .packageCarbs:   nil
        }
        
        self.focused = next
      }
      .submitLabel(.continue)
      
      // MARK: - Toolbar
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button(action: {
            do {
              try viewModel.createFoodEntry(dataManager: dataManager)
            } catch {
              errorHandler.handle(error)
            }
          }) {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}
