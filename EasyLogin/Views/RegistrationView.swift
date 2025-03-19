//
//  RegistrationView.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var isPasswordVisible: Bool = false
    @State private var isCopyPasswordVisible: Bool = false
    @State private var navigateToLogin: Bool = false
    @State private var showPopup: Bool = false
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20){
                    Image("Logo").resizable().frame(width: 200, height: 200).padding(.top,30)
                    Text("Sign-Up").font(.largeTitle).fontWeight(.bold).padding(.top, 10)
                    TextField("Username", text: $viewModel.username).padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    HStack{
                        if isPasswordVisible {
                            TextField("Password", text: $viewModel.password).autocorrectionDisabled()
                        } else {
                            SecureField("Password", text: $viewModel.password).autocorrectionDisabled()
                        }
                        Button(action:{
                            isPasswordVisible.toggle()
                        }){
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye").foregroundColor(.gray)
                        }
                    }
                    .padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    HStack{
                        if isCopyPasswordVisible {
                            TextField("Repeat Password", text: $viewModel.copyPassword).autocorrectionDisabled()
                        } else {
                            SecureField("Repeat Password", text: $viewModel.copyPassword).autocorrectionDisabled()
                        }
                        Button(action:{
                            isCopyPasswordVisible.toggle()
                        }){
                            Image(systemName: isCopyPasswordVisible ? "eye.slash" : "eye").foregroundColor(.gray)
                        }
                    }.padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    Button(action: {
                        viewModel.registration()
                        if viewModel.isRegistrated {
                            showPopup = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                navigateToLogin = true
                            }
                        }
                    }){
                        Text("Sign Up").foregroundColor(.white)
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
                    
                    NavigationLink(destination: LoginView()){
                        Text("Do you have an account? Login").foregroundColor(.blue)
                    }.padding(.top,10)
                    Spacer()
                }
                .alert(isPresented: $showPopup) {
                    Alert(
                        title: Text("Success"),
                        message: Text("You Signed Up successfully!"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
    }
}

#Preview {
    RegistrationView()
}
