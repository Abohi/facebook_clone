

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @MainActor
    func login() async throws {
        do{
            try await AuthService.shared.login(email: email, password: password)
        }catch{
            self.errorMessage = "Failed to login: \(error.localizedDescription)"
        }
    }
    
}
