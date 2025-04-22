import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    init() {
    }
    
    func loadLaunchDetails() {
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
