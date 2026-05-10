//

import Foundation

@Observable
final class AppRouter {
  var selectedTab: Tab = .today
  
  enum Tab: Hashable {
    case statistic
    case today
    case settings
  }
}
