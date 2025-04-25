import SwiftUI
import Apollo
import BookARocketAPI
import KeychainSwift

final class DetailViewModel: ObservableObject {
    
    @Published var launch: LaunchDetailQuery.Data.Launch?
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    let launchID: BookARocketAPI.ID
    
    init(launchID: BookARocketAPI.ID) {
        self.launchID = launchID
    }
    
    func loadLaunchDetails(forceReload: Bool = false) {
        guard forceReload || launchID != launch?.id else {
            return
        }
        
        let cachePolicy: CachePolicy = forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch

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
        guard let launch = launch else {
            return
        }
                
        launch.isBooked ? cancelTrip(with: launch.id) : bookTrip(with: launch.id)
    }
    
    private func bookTrip(with id: BookARocketAPI.ID) {
        Network.shared.apollo.perform(mutation: BookTripsMutation(launchIds: [id])) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let bookingResult = graphQLResult.data?.bookTrips {
                    if bookingResult.success {
                        self.appAlert = .basic(title: "Success!",
                                               message: bookingResult.message ?? "Trip booked successfully")
                        self.loadLaunchDetails(forceReload: true)
                    } else {
                        self.appAlert = .basic(title: "Could not book trip",
                                               message: bookingResult.message ?? "Unknown failure")
                    }
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    private func cancelTrip(with id: BookARocketAPI.ID) {
        Network.shared.apollo.perform(mutation: CancelTripMutation(launchId: id)) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let cancelResult = graphQLResult.data?.cancelTrip {
                    if cancelResult.success {
                        self.appAlert = .basic(title: "Trip cancelled",
                                               message: cancelResult.message ?? "Your trip has been officially cancelled")
                        self.loadLaunchDetails(forceReload: true)
                    } else {
                        self.appAlert = .basic(title: "Could not cancel trip",
                                               message: cancelResult.message ?? "Unknown failure.")
                    }
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    private func isLoggedIn() -> Bool {
        let keychain = KeychainSwift()
        return keychain.get(LoginView.loginKeychainKey) != nil
    }
    
}
