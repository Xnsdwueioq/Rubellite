//

import SwiftUI

struct AppTabsView: View {
  @Environment(AppRouter.self) private var router
  
  var body: some View {
    @Bindable var router = router
    
    NavigationStack {
      TabView(selection: $router.selectedTab) {
        // MARK: - Statistic Tab
        Tab(
          value: AppRouter.Tab.statistic,
          content: {
            StatisticTabView()
          },
          label: {
            Image(systemName: "chart.bar.xaxis")
          }
        )
        
        // MARK: - Today Tab
        Tab(
          value: AppRouter.Tab.today,
          content: {
            TodayTabView()
          },
          label: {
            Image(systemName: "text.rectangle.page")
          }
        )
        
        Tab(
          value: AppRouter.Tab.settings,
          content: {
            Text("Settings")
          },
          label: {
            Image(systemName: "gear")
          }
        )
      }
    }
  }
}

#Preview {
  AppTabsView()
    .withPreviewDependencies()
}
