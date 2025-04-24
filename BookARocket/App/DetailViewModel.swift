import SwiftUI
import BookARocketAPI

class DetailViewModel: ObservableObject {
    
    @Published var launch: LaunchDetailQuery.Data.Launch?
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    let launchID: BookARocketAPI.ID
    
    init(launchID: BookARocketAPI.ID) {
        self.launchID = launchID
    }
    
    func loadLaunchDetails() {
        guard launchID != launch?.id else {
            return
        }

        Network.shared.apollo.fetch(query: LaunchDetailQuery(launchId: launchID)) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let launch = graphQLResult.data?.launch {
                    self.launch = launch
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    func bookOrCancel() {
        guard self.isLoggedIn() else {
            isShowingLogin = true
            return
        }
    }
    
    private func bookTrip() {
        print("Book Trip!")
    }
    
    private func cancelTrip() {
        print("Cancel Trip!")
    }
    
    private func isLoggedIn() -> Bool {
        return false
    }
    
}
