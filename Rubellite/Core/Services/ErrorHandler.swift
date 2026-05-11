//

import Foundation

enum AppError: LocalizedError {
  case saveFailed
  case deleteFailed
  case fetchFailed
  case nutritionCalculeFailed
  
  var errorDescription: String? {
    switch self {
    case .saveFailed: "Не удалось сохранить данные."
    case .deleteFailed: "Не удалось удалить данные."
    case .fetchFailed: "Не удалось загрузить данные."
    case .nutritionCalculeFailed: "Не удалось выполнить расчет состава продукта."
    }
  }
}

struct AppAlert: Identifiable {
  var id = UUID()
  var title: String = "Ошибка"
  var message: String
}

@Observable
final class ErrorHandler {
  var currentAlert: AppAlert?
  
  func handle(_ error: Error) {
    currentAlert = AppAlert(message: error.localizedDescription)
  }
}
