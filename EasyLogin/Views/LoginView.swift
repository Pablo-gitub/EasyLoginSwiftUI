//
//  LoginView.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView(){
            VStack (spacing: 20){
                Image("Logo").resizable().frame(width: 200, height: 200).padding(.top,30)
                Text("Login").font(.largeTitle).fontWeight(.bold).padding(.top, 10)
                TextField("Username", text: $username).padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                
                TextField("Password", text: $password).padding().background(Color(.systemGray6)).cornerRadius(8).padding(.horizontal)
                
                Button(action: {
                    
                }){
                    Text("Login").foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: RegistrationView()){
                    Text("Don't have an account? Sign up").foregroundColor(.blue)
                }.padding(.top,10)
                Spacer()

            }
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
