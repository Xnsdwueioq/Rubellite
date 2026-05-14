//

import SwiftUI

struct FoodEntryFormView: View {
  
  enum Field: Hashable {
    case name
    case grams, calories, protein, fat, carbs
    case portionGrams, packageGrams, packageCalories, packageProtein, packageFat, packageCarbs
  }
  
  @Environment(\.dismiss) private var dismiss
  @Environment(DataManager.self) private var dataManager
  @Environment(ErrorHandler.self) private var errorHandler
  @Bindable var viewModel: FoodEntryFormViewModel
  @FocusState private var focused: Field?
  
  var body: some View {
    NavigationStack {
      List {
        Section("Детали") {
          TextField("Название", text: $viewModel.foodEntryDraft.name)
            .focused($focused, equals: .name)
            .onSubmit {
              focused = .grams
            }
          DatePicker("Дата", selection: $viewModel.foodEntryDraft.date)
        }
        Section("Состав") {
          Toggle("С упаковки", systemImage: "list.dash.header.rectangle", isOn: $viewModel.foodEntryDraft.isPackageMode.animation(.snappy))
          if !viewModel.foodEntryDraft.isPackageMode {
            TextField("Граммы", text: $viewModel.foodEntryDraft.grams)
              .focused($focused, equals: .grams)
            TextField("Каллории", text: $viewModel.foodEntryDraft.calories)
              .focused($focused, equals: .calories)
            TextField("Белки", text: $viewModel.foodEntryDraft.protein)
              .focused($focused, equals: .protein)
            TextField("Жиры", text: $viewModel.foodEntryDraft.fat)
              .focused($focused, equals: .fat)
            TextField("Углеводы", text: $viewModel.foodEntryDraft.carbs)
              .focused($focused, equals: .carbs)
              .submitLabel(.done)
          } else {
            TextField("Граммы порции", text: $viewModel.foodEntryDraft.portionGrams)
              .focused($focused, equals: .portionGrams)
            TextField("Граммы с упаковки", text: $viewModel.foodEntryDraft.packageGrams)
              .focused($focused, equals: .packageGrams)
            TextField("Каллории с упаковки", text: $viewModel.foodEntryDraft.packageCalories)
              .focused($focused, equals: .packageCalories)
            TextField("Белки с упаковки", text: $viewModel.foodEntryDraft.packageProtein)
              .focused($focused, equals: .packageProtein)
            TextField("Жиры с упаковки", text: $viewModel.foodEntryDraft.packageFat)
              .focused($focused, equals: .packageFat)
            TextField("Углеводы с упаковки", text: $viewModel.foodEntryDraft.packageCarbs)
              .focused($focused, equals: .packageCarbs)
              .submitLabel(.done)
          }
        }
        .keyboardType(.numbersAndPunctuation)
      }
      .navigationTitle(viewModel.navigationTitle)
      .navigationBarTitleDisplayMode(.inline)
      
      // MARK: - Field Focus Settings
      .onAppear { focused = .name }
      .onSubmit {
        guard let focused else { return }
        let isPackage = viewModel.foodEntryDraft.isPackageMode
        
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
              try viewModel.save(dataManager: dataManager)
              dismiss()
            } catch {
              errorHandler.handle(error)
            }
          }) {
            Image(systemName: viewModel.saveButtonSysemImage)
          }
        }
      }
    }
  }
}
