import SwiftUI

struct LaunchHistoriesView: View {
    
    @StateObject private var viewModel = LaunchHistoriesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<viewModel.launches.count, id: \.self) { index in
                    LaunchRow(launch: viewModel.launches[index])
                }
                if viewModel.mostRecentLaunchConnection?.hasMore != false {
                        if viewModel.activeRequest == nil {
                            Button(action: viewModel.loadMoreLaunchesIfTheyExist) {
                                Text("Tap to load more")
                            }
                        } else {
                            Text("Loading...")
                        }
                    }
            }
            .task {
                viewModel.loadMoreLaunchesIfTheyExist()
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
