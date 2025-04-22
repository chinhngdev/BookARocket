import SwiftUI

struct LaunchHistoriesView: View {
    
    @StateObject private var viewModel = LaunchHistoriesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { index in
                    LaunchRow()
                }
            }
            .task {
            }
            .navigationTitle("Rocket Launches")
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }
    
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchHistoriesView()
    }
}
