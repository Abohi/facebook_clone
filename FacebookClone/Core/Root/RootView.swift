

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
        var body: some View {
            Group {
                if viewModel.userSession != nil {
                    MainTabbarView()
                } else {
                    LoginView()
                }
            }
            
        }
}

#Preview {
    RootView()
}
