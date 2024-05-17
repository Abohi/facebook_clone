
import Foundation
import Combine

class MenuViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
    
    @MainActor
    func logout() {
        AuthService.shared.signout()
    }
    
}
