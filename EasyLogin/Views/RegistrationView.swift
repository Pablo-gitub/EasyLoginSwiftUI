//
//  RegistrationView.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var copyPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isCopyPasswordVisible: Bool = false
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20){
                    Image("Logo").resizable().frame(width: 200, height: 200).padding(.top,30)
                    Text("Sign-Up").font(.largeTitle).fontWeight(.bold).padding(.top, 10)
                    TextField("Username", text: $username).padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    HStack{
                        if isPasswordVisible {
                            TextField("Password", text: $password).autocorrectionDisabled()
                        } else {
                            SecureField("Password", text: $password).autocorrectionDisabled()
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
                            TextField("Repeat Password", text: $copyPassword).autocorrectionDisabled()
                        } else {
                            SecureField("Repeat Password", text: $copyPassword).autocorrectionDisabled()
                        }
                        Button(action:{
                            isCopyPasswordVisible.toggle()
                        }){
                            Image(systemName: isCopyPasswordVisible ? "eye.slash" : "eye").foregroundColor(.gray)
                        }
                    }.padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                    Button(action: {
                        
                    }){
                        Text("Sign Up").foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: LoginView()){
                        Text("Do you have an account? Login").foregroundColor(.blue)
                    }.padding(.top,10)
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
            }
        
    }
}

#Preview {
    RegistrationView()
}
