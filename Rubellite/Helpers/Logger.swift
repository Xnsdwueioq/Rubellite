//

import Foundation
import os

extension Logger {
  private static var subsystem = Bundle.main.bundleIdentifier!
  
  static let ui = Logger(subsystem: subsystem, category: "UI")
  static let database = Logger(subsystem: subsystem, category: "Database")
}
