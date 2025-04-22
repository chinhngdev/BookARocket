import SwiftUI
import BookARocketAPI

class LaunchHistoriesViewModel: ObservableObject {
    
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    init() {
    }
    
    // MARK: - Subscriptions
    
    func startSubscription() {
    }
    
    private func handleTripsBooked(value: Int) {
        var message: String
        switch value {
            message = "A new trip was booked! 🚀"
        case -1:
            message = "A trip was cancelled! 😭"
        default:
            appAlert = .basic(title: "Unexpected Value",
                              message: "Subscription returned an unexpected value: \(value)")
            return
        }
        
        notificationMessage = message
    }
    
    // MARK: - Launch Loading
    
    func loadMoreLaunchesIfTheyExist() {
    }
    
    func loadMoreLaunches() {
    }
    
}
