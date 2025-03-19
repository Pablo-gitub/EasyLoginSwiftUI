//
//  LoginView.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import SwiftUI

struct LoginView: View {
    @State private var isPasswordVisible: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToHome: Bool = false
    @State private var showPopup: Bool = false

    var body: some View {
            ScrollView {
                VStack (spacing: 20){
                    Image("Logo").resizable().frame(width: 200, height: 200).padding(.top,30)
                    Text("Login").font(.largeTitle).fontWeight(.bold).padding(.top, 10)
                    TextField("Username", text: $viewModel.username).padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    
                    HStack{
                        if isPasswordVisible{
                            TextField("Password", text:$viewModel.password).autocorrectionDisabled()
                        } else {
                            SecureField("Password", text:$viewModel.password).autocorrectionDisabled()
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }){
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye").foregroundColor(.gray)
                        }
                    }.padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    
                    Button(action: {
                        viewModel.login()
                        if viewModel.isAuthenticated {
                            showPopup = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                navigateToHome = true
                            }
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: RegistrationView()){
                        Text("Don't have an account? Sign up").foregroundColor(.blue)
                    }.padding(.top,10)
                    Spacer()
                    
                }
                .alert(isPresented: $showPopup) {
                    Alert(
                        title: Text("Success"),
                        message: Text("You logged in successfully!"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToHome) {
            HomeView()
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
