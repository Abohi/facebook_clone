

import SwiftUI
import AwesomeToast
struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var toast: Toast? = nil
    @State private var isLoading:Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 70) {
                    Spacer()
                    Image("Facebook_Circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                    VStack(spacing: 24) {
                        TextField("Mobile number or email address",text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        SecureField("Password",text: $viewModel.password)
                            .textInputAutocapitalization(.none)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Button(action: {
                            Task { 
                                if viewModel.password.isEmpty || viewModel.email.isEmpty{
                                    toast = Toast(style: .warning, message: "Field cannot be empty",forgroundColor: .white, backgroundColor:.black)
                                    return
                                }
                                isLoading = true
                                try await viewModel.login()
                                isLoading = false
                                if let toastMessage = viewModel.errorMessage {
                                                      toast = Toast(style: .error, message: toastMessage, forgroundColor: .white, backgroundColor: .black)
                                                  }
                            }
                        }, label: {
                            Text("Log In")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay{
                                    if(isLoading){
                                        ProgressView()
                                    }
                                }
                        })
                        Text("Forgotten Password?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    HStack { Spacer()}
                    Spacer()
                    VStack(spacing: 24) {
                        NavigationLink {
                            AddNameView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Create new account")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(lineWidth: 1)
                                }
                        }
                        HStack(spacing: 5) {
                            Image("meta")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 16)
                            Text("Meta")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(Color(.darkGray))
                    }
                    
                }
                .background(Color(.systemGray5))
                .toastView(toast: $toast)
            }
        }
    }
}

#Preview {
    LoginView()
}
