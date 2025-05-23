import SwiftUI
import Apollo
import BookARocketAPI

class LaunchHistoriesViewModel: ObservableObject {
    
    @Published var launches = [LaunchHistoriesQuery.Data.Launches.Launch]()
    @Published var mostRecentLaunchConnection: LaunchHistoriesQuery.Data.Launches?
    @Published var activeRequest: Cancellable?
    var activeSubscription: Cancellable?
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    init() {
        startSubscription()
    }
    
    // MARK: - Subscriptions
    func startSubscription() {
        activeSubscription = Network.shared.apollo.subscribe(subscription: TripsUpdatedSubscription()) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let tripsBooked = graphQLResult.data?.tripsBooked {
                    self.handleTripsBooked(value: tripsBooked)
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    private func handleTripsBooked(value: Int) {
        var message: String
        switch value {
        case 1:
            message = "A new trip was booked! 🚀"
        case -1:
            message = "A trip was cancelled! 😭"
        default:
            appAlert = .basic(
                title: "Unexpected Value",
                message: "Subscription returned an unexpected value: \(value)"
            )
            return
        }
        
        notificationMessage = message
    }
    
    // MARK: - Launch Loading
    
    func loadMoreLaunchesIfTheyExist() {
        guard let connection = self.mostRecentLaunchConnection else {
            self.loadMoreLaunches(from: nil)
            return
        }

        guard connection.hasMore else {
            return
        }

        self.loadMoreLaunches(from: connection.cursor)
    }
    
    private func loadMoreLaunches(from cursor: String?) {
        self.activeRequest = Network.shared.apollo.fetch(query: LaunchHistoriesQuery(cursor: cursor ?? .null)) { [weak self] result in
            guard let self = self else {
                return
            }

            self.activeRequest = nil

            switch result {
            case .success(let graphQLResult):
                if let launchConnection = graphQLResult.data?.launches {
                    self.mostRecentLaunchConnection = launchConnection
                    self.launches.append(contentsOf: launchConnection.launches.compactMap({ $0 }))
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
}
